import 'package:app_login_signin/models/user.dart';
import 'package:flutter/material.dart';

class UserLoginResult {
  final User user;
  final String message;
  final bool result;

  const UserLoginResult({
    @required this.user,
    @required this.message,
    @required this.result,
  });

  UserLoginResult.fromMap(Map<String, dynamic> map)
      : user = User.fromJson(map['user']),
        message = map['message'],
        result = map['result'];
}
