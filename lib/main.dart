import 'package:app_login_signin/auth_bloc/auth_bloc.dart';
import 'package:app_login_signin/auth_bloc/auth_exports.dart';
import 'package:app_login_signin/data/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => UserRepository()),
      ],
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthBloc(RepositoryProvider.of<UserRepository>(context)))],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: LoginPage(),
        ),
      ),
    );
  }
}
