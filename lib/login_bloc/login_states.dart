import 'package:app_login_signin/models/password.dart';
import 'package:app_login_signin/models/user_name.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  final UserName userName;
  final Password password;
  final FormzStatus formzStatus;
final  String message;
  @override
  List<Object> get props => [];

  const LoginState({
    this.userName,
    this.password,
    this.formzStatus,
    this.message,
  });

  LoginState copyWith({UserName userName, Password password, FormzStatus formStatus, String message}) {
    return LoginState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      formzStatus: formzStatus ?? this.formzStatus,
      message: message??""
    );
  }


}
