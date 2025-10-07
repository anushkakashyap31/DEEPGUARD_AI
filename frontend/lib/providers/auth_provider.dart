import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  AuthProvider() {
    // Listen for auth state changes
    _authService.authStateChanges.listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  // Getters
  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _user != null;
  String? get errorMessage => _errorMessage;

  // 🔹 Register with email & password
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

  // 🔹 Login with email & password
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

  // 🔹 Logout
  Future<void> logout() async {
    await _authService.logout();
    _user = null;
    notifyListeners();
  }

  // 🔹 Private helper to manage loading state
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
