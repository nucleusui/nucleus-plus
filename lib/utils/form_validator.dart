bool isValidEmail(String? value) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value ?? '');
}

class FormValidator {
  static String Function(String?)? email = (String? value) {
    if (value?.isEmpty ?? false) {
      return 'please enter email';
    } else if (!isValidEmail(value)) {
      return 'please enter correct email format';
    } else {
      return '';
    }
  };

  static String Function(String?)? password = (String? value) {
    if (value?.isEmpty ?? false) {
      return 'please enter password';
    } else {
      return '';
    }
  };
}
