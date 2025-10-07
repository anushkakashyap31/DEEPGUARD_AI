import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AwarenessScreen extends StatelessWidget {
  const AwarenessScreen({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Digital Awareness"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            const Text(
              "Deepfake & Fraud Awareness",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
            const SizedBox(height: 16),
            const Text(
              "Deepfakes are synthetic media where a person's likeness or voice is replaced with AI-generated content. "
              "Fraudulent calls often use similar techniques to impersonate trusted sources. Stay vigilant!",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              "Tips to Stay Safe:",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
            const SizedBox(height: 8),
            const Text(
              "• Verify caller identity before sharing sensitive information\n"
              "• Avoid clicking on suspicious links or attachments\n"
              "• Use AI-based detection tools like DeepGuard AI\n"
              "• Report suspicious activity to authorities",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyanAccent.shade400,
                foregroundColor: Colors.black87,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                _launchURL("https://www.cisa.gov/deepfake"); // Example resource
              },
              child: const Text("Learn More"),
            ),
          ],
        ),
      ),
    );
  }
}
