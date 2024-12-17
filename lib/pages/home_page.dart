import 'package:flutter/material.dart';
import 'package:trip_flutter/dao/home_dao.dart';
import 'package:trip_flutter/dao/login_dao.dart';
import 'package:trip_flutter/model/home_model.dart';
import 'package:trip_flutter/util/navigator_util.dart';
import 'package:trip_flutter/widget/banner_widget.dart';
import 'package:trip_flutter/widget/grid_nav_widget.dart';
import 'package:trip_flutter/widget/local_nav_widget.dart';

class HomePage extends StatefulWidget {
  static Config? configModel;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleRefresh();
  }

  static const appBarScrollOffset = 100;

  List<CommonModel> bannerList = [];
  List<CommonModel> localNavList = [];
  List<CommonModel> subNavList = [];
  GridNav? gridNavModel;
  SalesBox? salesBoxModel;

  double appBarAlpha = 1;

  get _logoutBtn => TextButton(
      onPressed: () => LoginDao.logout(),
      child: const Text(
        "登出",
        style: TextStyle(color: Colors.white),
      ));

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Stack(
        children: [
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollNotification &&
                        scrollNotification.depth == 0) {
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                    return false;
                  },
                  child: _listView)),
          _appBar
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  get _appBar => Opacity(
        opacity: appBarAlpha,
        child: Container(
          height: 80,
          decoration: const BoxDecoration(color: Colors.white),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text('首页'),
            ),
          ),
        ),
      );

  get _listView => ListView(
        children: [
          BannerWidget(bannerList: bannerList),
          LocalNavWidget(localNavList: localNavList),
          if (gridNavModel != null) GridNavWidget(gridNavModel: gridNavModel!),
          _logoutBtn,
          const SizedBox(
            height: 800,
            child: ListTile(
              title: Text('测'),
            ),
          )
        ],
      );

  void _onScroll(double offset) {
    double alpha = offset / appBarScrollOffset;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  Future<void> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();

      setState(() {
        HomePage.configModel = model.config;
        localNavList = model.localNavList ?? [];
        subNavList = model.subNavList ?? [];
        gridNavModel = model.gridNav;
        salesBoxModel = model.salesBox;
        bannerList = model.bannerList ?? [];
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
