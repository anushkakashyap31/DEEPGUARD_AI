import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String fileType;
  const ResultScreen({Key? key, required this.fileType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulated random result
    final bool isSafe = DateTime.now().second % 2 == 0;
    final String status = isSafe ? "Safe" : "Fake";
    final double confidence = isSafe ? 95 : 42;

    return Scaffold(
      appBar: AppBar(title: Text("$fileType Analysis Result")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Result: $status",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: isSafe ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Confidence: ${confidence.toStringAsFixed(1)}%",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text("Analyze Another File"),
              onPressed: () => Navigator.popUntil(
                  context, (route) => route.isFirst), // Go back to Manual Mode
            ),
          ],
        ),
      ),
    );
  }
}
