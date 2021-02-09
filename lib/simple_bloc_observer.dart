import 'package:app_login_signin/auth_bloc/auth_exports.dart';
import 'package:app_login_signin/login_bloc/login_bloc_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    if (cubit is LoginCubit)
      print(("observer :${cubit.state.formzStatus }"));
    super.onChange(cubit, change);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    if (bloc is AuthBloc) print((bloc as AuthBloc).state);
    super.onEvent(bloc, event);
  }
}
