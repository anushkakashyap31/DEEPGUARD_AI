import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  AuthProvider() {
    // Listen for authentication state changes
    _authService.authStateChanges.listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  // 🔹 Getters
  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _user != null;
  String? get errorMessage => _errorMessage;

  // 🔹 Register user
  Future<void> register(String email, String password) async {
    _setLoading(true);
    try {
      await _authService.registerWithEmail(email, password);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  // 🔹 Login user
  Future<void> login(String email, String password) async {
    _setLoading(true);
    try {
      await _authService.loginWithEmail(email, password);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  // 🔹 Logout user
  Future<void> logoutUser() async {
    try {
      await _authService.logout();
      _user = null;
      notifyListeners();
    } catch (e) {
      debugPrint("Logout failed: $e");
    }
  }

  // 🔹 Private helper
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
