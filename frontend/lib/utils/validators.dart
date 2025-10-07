class Validators {
  /// Validate email format
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email cannot be empty";
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) return "Enter a valid email address";
    return null;
  }

  /// Validate password strength
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password cannot be empty";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  /// Validate non-empty field
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) return "$fieldName cannot be empty";
    return null;
  }
}
