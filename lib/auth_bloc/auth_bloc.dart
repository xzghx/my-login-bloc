import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_exports.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthState initialState) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
