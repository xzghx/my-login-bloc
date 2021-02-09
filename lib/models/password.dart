import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.dirty(value) : super.dirty(value);

  const Password.pure([String value = '']) : super.pure(value);

  static RegExp regExp = RegExp(r'');

  @override
  PasswordValidationError validator(value) {
    return regExp.hasMatch(value) ? null : PasswordValidationError.invalid;
  }
}
