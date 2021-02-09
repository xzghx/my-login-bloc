import 'package:app_login_signin/models/user.dart';
import 'package:flutter/material.dart';

class UserLoginResult {
  final User user;
  final String message;

  const UserLoginResult({
    @required this.user,
    @required this.message,
  });

  UserLoginResult.fromMap(Map<String, dynamic> map)
      : user = map['user'] != null ? User.fromJson(map['user']) : null,
        message = map['message'];
}
