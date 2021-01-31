import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final String lastName;
  final String userName;

  const User({
    @required this.id,
    @required this.name,
    @required this.lastName,
    @required this.userName,
  });

  User.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.name = json['name'],
        this.lastName = json['lastName'],
        this.userName = json['userName'];

  static const empty = User(id: null, name: null, lastName: null, userName: null);
}
