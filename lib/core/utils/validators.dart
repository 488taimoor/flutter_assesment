import 'package:flutter/cupertino.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class Validators {
  Validators(this.context);

  BuildContext context;

  String? maskedPhoneNumberValidator(String? text) {
    if (text == null || text.isEmpty) {
      return null;
    } else {
      if (text.length <= 9) {
        // return context.appStrings.invalid_phone_number;
      }
    }
    return null;
  }

  String? phoneNumberValidator(String? text) {
    if (text == null || text.isEmpty) {
      return null;
    } else {
      if (text.length != 9) {
        // return context.appStrings.invalid_phone_number;
      }
    }
    return null;
  }

  String? ibanValidator(String? text) {
    if (text == null || text.isEmpty) {
      return null;
    } else {
      if (text.length != 22) {
        // return context.appStrings.iban_validation;
      }
    }
    return null;
  }

  String? passPortValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      // return context.appStrings.error_required_text;
    }

    return null;
  }

  String? birthDateValidator(String? text) {
    if (text == null || text.isEmpty) {
      return null;
    } else {
      if (text.length < 10) {
        // return context.appStrings.invalid_date;
      }
    }
    return null;
  }

  String? emailValidator(String? email) {
    if (email == null || email.trim().isEmpty) {
      return context.appStrings.please_enter_email;
    } else {
      return RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(
        email.trim(),
      )
          ? null
          : context.appStrings.invalid_email_address;
    }
  }

  String? newPasswordValidator(String? text) {
    if (text == null || text.isEmpty) {
      return null;
    } else {
      if (text.length < 8 &&
          !RegExp(r"""^(?=.*[\d!@#£~`|€¥₣₹¢$%^&*()_\-+=?<>\\/{}[\]_.,:;×÷'™®©π"√|∆|✓•°§])[A-Za-z\d!@#£~`|€¥₣₹¢$%^&*()_\-+=?<>\\/{}[\]_.,:;'×÷™®©π"√|∆|✓•°§]+$""")
              .hasMatch(text)) {
        return 'ⓘ ${context.appStrings.weak_password}\nⓘ ${context.appStrings.password_length_validator}\nⓘ ${context.appStrings.password_string_validator}';
      } else if (text.length < 8) {
        return 'ⓘ ${context.appStrings.weak_password}\nⓘ ${context.appStrings.password_length_validator}';
      } else if (!RegExp(
              r"""^(?=.*[\d!@#£~`|€¥₣₹¢$%^&*()_\-+=?<>\\/{}[\]_.,:;×÷'™®©π"√|∆|✓•°§])[A-Za-z\d!@#£~`|€¥₣₹¢$%^&*()_\-+=?<>\\/{}[\]_.,:;'×÷™®©π"√|∆|✓•°§]+$""")
          .hasMatch(text)) {
        return 'ⓘ ${context.appStrings.password_string_validator}';
      }
    }
    return null;
  }

  String? passwordValidator(String? text) {
    if (text == null || text.isEmpty) {
      return context.appStrings.please_enter_password;
    } else {
      return null;
    }
  }

  String? validateReEnterPasswordField(
      String? reEnterPasswordText, String newPasswordText) {
    if (reEnterPasswordText == null || reEnterPasswordText.isEmpty) {
      return null;
    } else {
      return reEnterPasswordText == newPasswordText
          ? null
          : context.appStrings.password_must_be_same;
    }
  }

  String? requiredFieldValidator(String? text, String? errorMessage) {
    if (text == null || text.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  String? firstNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.appStrings.enter_first_name;
    }
    return null;
  }

  String? lastNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.appStrings.enter_last_name;
    }
    return null;
  }
}
