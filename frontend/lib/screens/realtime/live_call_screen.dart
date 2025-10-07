import 'dart:async';
import 'package:flutter/material.dart';
import 'call_alert_screen.dart';

class LiveCallScreen extends StatefulWidget {
  const LiveCallScreen({Key? key}) : super(key: key);

  @override
  State<LiveCallScreen> createState() => _LiveCallScreenState();
}

class _LiveCallScreenState extends State<LiveCallScreen> {
  double _confidence = 0.0;
  Timer? _timer;
  bool _alertTriggered = false;

  @override
  void initState() {
    super.initState();
    _startDetection();
  }

  void _startDetection() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _confidence = (_confidence + 15) % 100;
        if (_confidence > 70 && !_alertTriggered) {
          _alertTriggered = true;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CallAlertScreen()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Detection")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mic, size: 80, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text(
              "Monitoring in real-time...",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            Text(
              "Confidence: ${_confidence.toStringAsFixed(0)}%",
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Stop Detection"),
            )
          ],
        ),
      ),
    );
  }
}
