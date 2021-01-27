import 'dart:convert';
import 'dart:io';

import 'package:app_login_signin/models/user_login_result.dart';
import 'package:http/http.dart' as http;

import '../Links.dart';
import '../models/user.dart';

class UserRepository {
  Future<UserLoginResult> login(Map<String, dynamic> data) async {
    UserLoginResult userLoginResult;

      http.Response response = await http.post(Links.login,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptLanguageHeader: 'en-Us',
            'Ping_Pong': 'custom_header',
          },
          body: data);
    userLoginResult = UserLoginResult.fromMap(json.decode(response.body));

    return userLoginResult;
  }
}
