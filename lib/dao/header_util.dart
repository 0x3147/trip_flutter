import 'package:trip_flutter/dao/login_dao.dart';

hiHeaders() {
  Map<String, String> header = {
    'auth-token': '',
    'course-flag': 'ft',
    'bordering-pass': LoginDao.getBoardingPass() ?? ''
  };

  return header;
}