

import 'package:flutter/material.dart';

import 'Widgets/login_form.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: LoginForm(),
    );
  }

}