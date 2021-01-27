import 'package:flutter/material.dart';

class UserLoginModel {
  final String userName;
  final String password;

  UserLoginModel({@required this.userName, @required this.password});

  Map<String,dynamic> toMap() {
    return {
      'userName': userName,
      'password': password,
    };
  }
}
