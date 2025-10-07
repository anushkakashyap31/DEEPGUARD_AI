import 'package:flutter/material.dart';

class RiskMeter extends StatelessWidget {
  final double risk; // 0.0 to 1.0

  const RiskMeter({Key? key, required this.risk}) : super(key: key);

  Color _getColor() {
    if (risk < 0.3) return Colors.green;
    if (risk < 0.7) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: risk,
          minHeight: 12,
          color: _getColor(),
          backgroundColor: Colors.white24,
        ),
        const SizedBox(height: 4),
        Text(
          "${(risk * 100).toStringAsFixed(1)}%",
          style: TextStyle(
            color: _getColor(),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
