import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('我的'),
        ),
        body: const Column(
          children: [Text('我的')],
        ));
  }
}