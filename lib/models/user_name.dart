import 'package:formz/formz.dart';

enum UserNameValidationError { invalid }

class UserName extends FormzInput<String, UserNameValidationError> {
 const UserName.dirty(value) : super.dirty(value);

  const UserName.pure([String value = '']) : super.dirty(value);

  static RegExp regExp = RegExp('r^(\w+)');

  @override
  validator(value) {
    return regExp.hasMatch(value) ? null : UserNameValidationError.invalid;
  }
}
