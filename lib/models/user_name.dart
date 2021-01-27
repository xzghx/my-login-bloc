import 'package:formz/formz.dart';

enum UserNameValidationError { invalid }

class UserName extends FormzInput<String, UserNameValidationError> {
  UserName.dirty(value) : super.dirty(value);

  UserName.pure([String value = '']) : super.dirty(value);

  static RegExp regExp = RegExp('r^');

  @override
  validator(value) {
    return regExp.hasMatch(value) ? null : UserNameValidationError.invalid;
  }
}
