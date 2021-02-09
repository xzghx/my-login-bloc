import 'package:app_login_signin/login_bloc/login_bloc_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

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
        maxLength: 8,
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
          print("buttom press :");
          print("formzStatus.isSubmissionInProgress");
          return CircularProgressIndicator();
        } else
          print("buttom press :");
          return RaisedButton(
            key: const Key('loginForm_continue_raisedButton'),
            color: Colors.amberAccent,
            child: Text("Login"),
            onPressed: () =>
                state.formzStatus.isInvalid ? null : context.read<LoginCubit>().loginRequested(),
          );
      },
    );
  }
}
