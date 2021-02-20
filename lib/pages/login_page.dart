import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/login_form.dart';
import '../auth_bloc/auth_bloc.dart';
import '../data/user_repository.dart';
import '../helpers/assets.dart';
import '../login_bloc/login_bloc_exports.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ورود به حساب کاربری'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.loginBg), fit: BoxFit.cover),
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black12,
                    Colors.orangeAccent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: BlocProvider(
                create: (BuildContext context) {
                  return LoginCubit(
                    userRepository: RepositoryProvider.of<UserRepository>(context),
                    authBloc: BlocProvider.of<AuthBloc>(context),
                  );
                },
                child: LoginForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
