import 'package:equatable/equatable.dart';

import '../models/user.dart';

enum AuthStatus {
  unKnown,
  authenticated,
  unAuthenticated,
}

class AuthState extends Equatable {
  final User user;
  final AuthStatus status;

  @override
  List<Object> get props => [user, status];

  //private constructor used by other named constructors to override AuthState's arguments
  const AuthState._({this.user = User.empty, this.status = AuthStatus.unKnown});

  ///unknown is the initial state that we want to determine whether user is Authenticated or not
  AuthState.unknown() : this._();

  ///user has successfully authenticated (via login or maybe sign in)
  AuthState.authenticated(User user) : this._(user: user, status: AuthStatus.authenticated);

  ///user has logged out and now in unAuthenticated
  AuthState.unAuthenticated() : this._(status: AuthStatus.unAuthenticated);
}
