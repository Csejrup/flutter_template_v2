import 'package:formz/formz.dart';
import 'package:template/l10n/l10n.dart';
import 'package:template/shared/utils/utils.dart';

enum PasswordValidationError { invalid }

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure([super.value = '']) : super.pure();
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    return passwordRegexExp.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}

extension on PasswordValidationError {
  // ignore: unused_element
  String errorMessage(AppLocalizations i10n) {
    switch (this) {
      case PasswordValidationError.invalid:
        return i10n.invalidPassword;
    }
  }
}
