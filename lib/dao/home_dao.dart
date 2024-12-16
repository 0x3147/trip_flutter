import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:trip_flutter/dao/header_util.dart';
import 'package:trip_flutter/util/navigator_util.dart';

class HomeDao {
  static Future<String?> fetch() async {
    var url = Uri.parse('https://api.geekailab.com/uapi/ft/home');

    final response = await http.get(url, headers: hiHeaders());
    Utf8Decoder utf8decoder = const Utf8Decoder();
    String bodyString = utf8decoder.convert(response.bodyBytes);
    debugPrint(bodyString);

    if (response.statusCode == 200) {
      return bodyString;
    } else {
      if (response.statusCode == 401) {
        NavigatorUtil.goToLogin();
        return null;
      }
      throw Exception(bodyString);
    }
  }
}
