import 'package:flutter/material.dart';
import 'package:trip_flutter/dao/login_dao.dart';
import 'package:trip_flutter/util/navigator_util.dart';
import 'package:trip_flutter/widget/banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  final bannerList = [
    'https://o.devio.org/images/fa/cat-4098058__340.webp',
    'https://o.devio.org/images/other/as-cover.png',
    'https://o.devio.org/images/other/rn-cover2.png'
  ];

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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          '首页',
          style: TextStyle(color: Colors.white),
        ),
        actions: [_logoutBtn],
      ),
      body: Column(
        children: [
          BannerWidget(bannerList: bannerList)
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
