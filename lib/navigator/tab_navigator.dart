import 'package:flutter/material.dart';
import 'package:trip_flutter/pages/home_page.dart';
import 'package:trip_flutter/pages/my_page.dart';
import 'package:trip_flutter/pages/search_page.dart';
import 'package:trip_flutter/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: _controller,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        HomePage(),
        SearchPage(),
        TravelPage(),
        MyPage(),
      ],
    ));
  }
}
