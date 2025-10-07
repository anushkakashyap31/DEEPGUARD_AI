class CallLog {
  final String id;
  final String callerName;
  final String callerNumber;
  final DateTime timestamp;
  final bool isFraud;
  final double confidence;

  CallLog({
    required this.id,
    required this.callerName,
    required this.callerNumber,
    required this.timestamp,
    required this.isFraud,
    required this.confidence,
  });

  factory CallLog.fromMap(Map<String, dynamic> map, String id) {
    return CallLog(
      id: id,
      callerName: map['callerName'] ?? '',
      callerNumber: map['callerNumber'] ?? '',
      timestamp: DateTime.parse(map['timestamp']),
      isFraud: map['isFraud'] ?? false,
      confidence: (map['confidence'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'callerName': callerName,
      'callerNumber': callerNumber,
      'timestamp': timestamp.toIso8601String(),
      'isFraud': isFraud,
      'confidence': confidence,
    };
  }
}
