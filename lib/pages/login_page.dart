import 'package:app_login_signin/auth_bloc/auth_bloc.dart';
import 'package:app_login_signin/data/user_repository.dart';
import 'package:app_login_signin/login_bloc/login_bloc_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) {
          return LoginCubit(userRepository: RepositoryProvider.of<UserRepository>(context
          ), authBloc:BlocProvider.of<AuthBloc>(context),
          );
        },
        child: LoginForm(),
      ),
    );
  }
}
