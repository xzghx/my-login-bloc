import 'package:app_login_signin/models/user_login_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../auth_bloc/auth_exports.dart';
import '../data/user_repository.dart';
import '../models/password.dart';
import '../models/user_login_model.dart';
import '../models/user_name.dart';
import 'login_bloc_exports.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;

  LoginCubit({
    @required this.userRepository,
    @required this.authBloc,
  }) : super(LoginState());

  void userNameChanged(String value) {
    final username = UserName.dirty(value);
    emit(
      state.copyWith(
        userName: username,
        formStatus: Formz.validate(
          [
            username,
            state.password,
          ],
        ),
      ),
    );
  }

  void userPasswordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        formStatus: Formz.validate(
          [
            password,
            state.userName,
          ],
        ),
      ),
    );
  }

  Future<void> loginRequested() async {
    if (state.formzStatus.isInvalid) return;

    emit(state.copyWith(formStatus: FormzStatus.submissionInProgress));

    //Login request to server
    UserLoginModel data = UserLoginModel(
      userName: state.userName.value,
      password: state.password.value,
    );

    try {
      UserLoginResult userLoginResult = await userRepository.login(data.toMap());
      //in case of success login add to auth bloc
      if (userLoginResult.user != null) {
        authBloc.add(LoggedIn(userLoginResult.user));
        emit(state.copyWith(formStatus: FormzStatus.submissionSuccess));
      } else {
        String errorMessage = userLoginResult.message;
        emit(
          state.copyWith(
            formStatus: FormzStatus.submissionFailure,
            message: errorMessage,
          ),
        );
      }
    } catch (error) {
      print("login error: $error");
      emit(
        state.copyWith(
            formStatus: FormzStatus.submissionFailure,
            message: "Some Error Happened.Please try later."),
      );
    }
  }

  @override
  String toString() {
    return "login form State: ${state.formzStatus.toString()}";
  }
}
