class DetectionResult {
  final String id;
  final String fileName;
  final String fileType; // 'image', 'audio', 'video'
  final double confidence;
  final String status; // 'Safe', 'Fake', 'Suspicious'
  final DateTime timestamp;

  DetectionResult({
    required this.id,
    required this.fileName,
    required this.fileType,
    required this.confidence,
    required this.status,
    required this.timestamp,
  });

  factory DetectionResult.fromMap(Map<String, dynamic> map, String id) {
    return DetectionResult(
      id: id,
      fileName: map['fileName'] ?? '',
      fileType: map['fileType'] ?? '',
      confidence: (map['confidence'] ?? 0).toDouble(),
      status: map['status'] ?? 'Safe',
      timestamp: DateTime.parse(map['timestamp']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fileName': fileName,
      'fileType': fileType,
      'confidence': confidence,
      'status': status,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
