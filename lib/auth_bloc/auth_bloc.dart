import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/user_repository.dart';
import 'auth_exports.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(UserRepository userRepository) : super(AuthState.unknown());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
