import 'package:flutter/material.dart';
import 'package:flutter_hi_cache/flutter_hi_cache.dart';
import 'package:trip_flutter/dao/login_dao.dart';
import 'package:trip_flutter/pages/home_page.dart';
import 'package:trip_flutter/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<dynamic>(
          future: HiCache.preInit(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (LoginDao.getBoardingPass() == null) {
                return const LoginPage();
              } else {
                return const HomePage();
              }
            } else {
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
            }
          }),
    );
  }
}
