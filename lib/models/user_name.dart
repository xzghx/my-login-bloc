import 'package:formz/formz.dart';

enum UserNameValidationError { invalid }

class UserName extends FormzInput<String, UserNameValidationError> {
 const UserName.dirty(value) : super.dirty(value);

  const UserName.pure([String value = '']) : super.pure(value);

  static RegExp regExp = RegExp(r'');

  @override
  UserNameValidationError validator(value) {
    return regExp.hasMatch(value) ? null : UserNameValidationError.invalid;
  }
}
