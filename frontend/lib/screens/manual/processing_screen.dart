import 'package:flutter/material.dart';
import 'result_screen.dart';

class ProcessingScreen extends StatefulWidget {
  final String fileType;
  const ProcessingScreen({Key? key, required this.fileType}) : super(key: key);

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  @override
  void initState() {
    super.initState();
    _simulateProcessing();
  }

  void _simulateProcessing() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(fileType: widget.fileType),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Processing")),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
