import 'package:flutter/material.dart';
import 'package:trip_flutter/util/string_util.dart';
import 'package:trip_flutter/util/view_util.dart';
import 'package:trip_flutter/widget/input_widget.dart';
import 'package:trip_flutter/widget/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginEnable = false;
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ..._background(),
          _content(),
        ],
      ),
    );
  }

  _background() {
    return [
      Positioned.fill(
          child: Image.asset('images/login-bg1.jpg', fit: BoxFit.cover)),
      Positioned(
          child: Container(
        decoration: const BoxDecoration(color: Colors.black54),
      ))
    ];
  }

  _content() {
    return Positioned.fill(
        left: 25,
        right: 25,
        child: ListView(
          children: [
            hiSpace(height: 100),
            const Text(
              '账号密码登录',
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
            hiSpace(height: 40),
            InputWidget(
              hint: "请输入账号",
              onChange: (text) {
                username = text;
                _checkInput();
              },
            ),
            hiSpace(height: 10),
            InputWidget(
              hint: "请输入密码",
              obscureText: true,
              onChange: (text) {
                password = text;
                _checkInput();
              },
            ),
            hiSpace(height: 45),
            LoginButton(
                title: '登录', enable: loginEnable, onPressed: () => _login())
          ],
        ));
  }

  void _checkInput() {
    bool enable;

    if (isNotEmpty(username) && isNotEmpty(password)) {
      enable = true;
    } else {
      enable = false;
    }

    setState(() {
      loginEnable = enable;
    });
  }

  _login() {}
}
