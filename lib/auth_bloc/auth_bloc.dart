import 'package:app_login_signin/data/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_exports.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(UserRepository userRepository) : super(UnKnown());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
