import 'package:app_login_signin/login_bloc/login_bloc_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginState>(
      listener: (context,state){
        if(state.formzStatus==FormzStatus.submissionInProgress)
          return CircularProgressIndicator();
       else if(state.formzStatus==FormzStatus.submissionFailure)
          return Text('Failer');
       else if(state.formzStatus==FormzStatus.submissionSuccess)
          return Text('Ok');
      }
      ,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _UserNameInput(),
            _PasswordInput(),
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
      builder: (context, state) => TextField(
        onChanged: (newValue) => context.read<LoginCubit>().userPasswordChanged(newValue),
      ),
    );
  }
}

class _UserNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => TextField(
        onChanged: (newValue) => context.read<LoginCubit>().userNameChanged(newValue),
      ),
    );
  }
}
