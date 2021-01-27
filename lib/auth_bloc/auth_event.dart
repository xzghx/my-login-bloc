import 'package:app_login_signin/auth_bloc/auth_exports.dart';
import 'package:app_login_signin/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class  AuthEvent extends Equatable{
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class LoggedIn extends AuthEvent
{
  final User user;
   LoggedIn(this.user);

   @override
  String toString() {
    return 'AuthEvent: LoggedIn name:${user.name} lastName:${user.lastName}';
  }
}