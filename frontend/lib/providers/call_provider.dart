import 'package:flutter/material.dart';
import '../models/call_log.dart';

class CallProvider with ChangeNotifier {
  final List<CallLog> _callLogs = [];

  // 🔹 Getters
  List<CallLog> get callLogs => List.unmodifiable(_callLogs);

  // 🔹 Add a new call log
  void addCallLog(CallLog log) {
    _callLogs.add(log);
    notifyListeners();
  }

  // 🔹 Remove a call log
  void removeCallLog(String id) {
    _callLogs.removeWhere((log) => log.id == id);
    notifyListeners();
  }

  // 🔹 Clear all logs
  void clearLogs() {
    _callLogs.clear();
    notifyListeners();
  }
}
