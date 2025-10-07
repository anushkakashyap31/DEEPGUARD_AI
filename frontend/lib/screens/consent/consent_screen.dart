import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../routes/app_routes.dart';

class ConsentScreen extends StatelessWidget {
  const ConsentScreen({Key? key}) : super(key: key);

  Future<void> _agree(BuildContext context) async {
    // Save consent
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasConsented', true);

    // Navigate based on login status
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (authProvider.isLoggedIn) {
      Navigator.pushReplacementNamed(context, AppRoutes.welcome);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  void _disagree(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Consent Required"),
        content: const Text(
          "You must agree to the terms to use DeepGuard AI.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Consent"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Consent for Data Collection",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              "DeepGuard AI respects your privacy. To provide accurate deepfake and fraud detection, "
              "we collect limited data such as email for authentication and optional AI analysis data. "
              "No personal media or call recordings are stored without your consent.",
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12)),
                  onPressed: () => _disagree(context),
                  child: const Text("Disagree"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent.shade400,
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12)),
                  onPressed: () => _agree(context),
                  child: const Text("Agree"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
