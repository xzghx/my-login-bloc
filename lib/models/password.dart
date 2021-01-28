import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  Password.dirty(value) : super.dirty(value);

  Password.pure([String value = '']) : super.dirty(value);

  static RegExp regExp = RegExp('r^(\w+)');

  @override
  validator(value) {
    return regExp.hasMatch(value) ? null : PasswordValidationError.invalid;
  }
}
