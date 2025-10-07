import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        backgroundColor: Colors.indigo,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            "DeepGuard AI respects your privacy. We only collect essential data for authentication "
            "and AI-based analysis. No personal media or call recordings are stored or shared "
            "without explicit consent.\n\n"
            "Data Collected:\n• Email for authentication\n• Optional analysis data (temporary)\n\n"
            "Your data is securely handled following industry standards and Firebase security policies.",
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
      ),
    );
  }
}
