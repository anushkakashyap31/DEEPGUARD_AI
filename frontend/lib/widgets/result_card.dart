import 'package:flutter/material.dart';
import '../widgets/risk_meter.dart';

class ResultCard extends StatelessWidget {
  final String title;
  final String status;
  final double confidence;
  final VoidCallback? onTap;

  const ResultCard({
    Key? key,
    required this.title,
    required this.status,
    required this.confidence,
    this.onTap,
  }) : super(key: key);

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case "safe":
        return Colors.green;
      case "suspicious":
        return Colors.orange;
      case "fake":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              RiskMeter(risk: confidence),
              const SizedBox(height: 8),
              Text(
                "Status: $status",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _getStatusColor(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
