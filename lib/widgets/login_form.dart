import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../login_bloc/login_bloc_exports.dart';
import '../pages/home_page.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.formzStatus == FormzStatus.submissionFailure)
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
        else if (state.formzStatus == FormzStatus.submissionSuccess)
          Navigator.of(context).push(HomePage.route());
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _UserNameInput(),
            _PasswordInput(),
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => TextField(
        onChanged: (newValue) => context.read<LoginCubit>().userPasswordChanged(newValue),
        maxLength: 10,
        decoration: InputDecoration(
          labelText: "Password",
          errorText: state.password.invalid ? "پسورد 8 کاراکتر پر شود" : null,
        ),
      ),
    );
  }
}

class _UserNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.userName != current.userName,
      builder: (context, state) => TextField(
        onChanged: (newValue) => context.read<LoginCubit>().userNameChanged(newValue),
        decoration: InputDecoration(
            labelText: "UserName",
            errorText: state.userName.invalid ? "نام کاربری وارد شود" : null),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (prev, current) => prev.formzStatus != current.formzStatus,
      builder: (context, state) {
        if (state.formzStatus.isSubmissionInProgress) {
          return CircularProgressIndicator();
        } else
          return RaisedButton(
            color: Colors.amberAccent,
            child: Text("Login"),
            onPressed: () =>
                state.formzStatus.isInvalid ? null : context.read<LoginCubit>().loginRequested(),
          );
      },
    );
  }
}
