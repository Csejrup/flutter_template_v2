import 'package:formz/formz.dart';
import 'package:template/l10n/l10n.dart';
import 'package:template/shared/utils/utils.dart';

enum EmailValidationError { invalid }

class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure([super.value = '']) : super.pure();
  const EmailInput.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    return emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

extension on EmailValidationError {
  // ignore: unused_element
  String errorMessage(AppLocalizations i10n) {
    switch (this) {
      case EmailValidationError.invalid:
        return i10n.invalidEmail;
    }
  }
}
