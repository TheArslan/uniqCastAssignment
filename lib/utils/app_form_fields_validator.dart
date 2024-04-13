class AppFormFieldValidator {
  AppFormFieldValidator._();

  static String? emptyFieldValidator(String? value, String errorMessage) {
    if (value != null && value.trim().isNotEmpty) {
      return null;
    }
    return errorMessage;
  }
}
