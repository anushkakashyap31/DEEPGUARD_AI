import 'package:flutter/material.dart';

class Helpers {
  /// Show a simple snackbar message
  static void showSnackBar(BuildContext context, String message,
      {Color backgroundColor = Colors.black87}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Format percentage (0-1) to string with %
  static String formatPercentage(double value) {
    return "${(value * 100).toStringAsFixed(1)}%";
  }

  /// Format datetime to readable string
  static String formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";
  }
}
