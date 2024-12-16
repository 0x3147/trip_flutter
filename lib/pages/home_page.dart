import 'package:flutter/material.dart';
import 'package:trip_flutter/dao/home_dao.dart';
import 'package:trip_flutter/dao/login_dao.dart';
import 'package:trip_flutter/util/navigator_util.dart';
import 'package:trip_flutter/widget/banner_widget.dart';

class HomePage extends StatefulWidget {
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

  final bannerList = [
    'https://o.devio.org/images/fa/cat-4098058__340.webp',
    'https://o.devio.org/images/other/as-cover.png',
    'https://o.devio.org/images/other/rn-cover2.png',
    'https://o.devio.org/images/fa/cat-4098058__340.webp',
    'https://o.devio.org/images/other/as-cover.png',
  ];

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
          _logoutBtn,
          Text(bodyString),
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

  var bodyString = '';

  Future<void> _handleRefresh() async {
    try {
      String? result = await HomeDao.fetch();
      setState(() {
        bodyString = result ?? '';
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
