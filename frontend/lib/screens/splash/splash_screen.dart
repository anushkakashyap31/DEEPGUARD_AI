import 'package:flutter/material.dart';
import 'package:frontend/routes/app_routes.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnAuth();
  }

  Future<void> _navigateBasedOnAuth() async {
    await Future.delayed(const Duration(seconds: 3)); // splash delay

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    // 🔹 Check if user has already given consent
    final prefs = await SharedPreferences.getInstance();
    bool hasConsented = prefs.getBool('hasConsented') ?? false;

    if (!hasConsented) {
      // First time user → show consent screen
      Navigator.pushReplacementNamed(context, AppRoutes.consent);
      return;
    }

    // 🔹 If consent is already given → check login status
    if (authProvider.isLoggedIn) {
      Navigator.pushReplacementNamed(context, AppRoutes.welcome);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D47A1), Color(0xFF512DA8), Color(0xFF7B1FA2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', width: 120, height: 120)
                  .animate()
                  .fadeIn(duration: 1500.ms)
                  .scale(duration: 1500.ms),
              const SizedBox(height: 20),
              const Text(
                "DeepGuard AI",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ).animate().fadeIn(delay: 500.ms, duration: 1500.ms),
              const SizedBox(height: 10),
              const Text(
                "Guarding You from Digital Deception",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ).animate().fadeIn(delay: 1000.ms, duration: 1500.ms),
            ],
          ),
        ),
      ),
    );
  }
}
