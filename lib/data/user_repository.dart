import 'dart:convert';
import 'dart:io';

import 'package:app_login_signin/models/user_login_result.dart';
import 'package:http/http.dart' as http;

import '../Links.dart';

class UserRepository {
  Future<UserLoginResult> login(Map<String, dynamic> data) async {
    UserLoginResult userLoginResult;
    http.Response response = await http.post(Links.login,
        headers: {
          'content-type': 'application/json',
          HttpHeaders.acceptLanguageHeader: 'en-Us',
          'X-PingMe': 'I_am_Pinging',
        },
        body: jsonEncode(data));
    print("Login Response :");
    print(json.decode(response.body));
    userLoginResult = UserLoginResult.fromMap(json.decode(response.body));

    return userLoginResult;
  }
}
