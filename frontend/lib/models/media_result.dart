class MediaResult {
  final String id;
  final String filePath;
  final String type; // 'image', 'video', 'audio'
  final bool isSafe;
  final double confidence;

  MediaResult({
    required this.id,
    required this.filePath,
    required this.type,
    required this.isSafe,
    required this.confidence,
  });

  factory MediaResult.fromMap(Map<String, dynamic> map, String id) {
    return MediaResult(
      id: id,
      filePath: map['filePath'] ?? '',
      type: map['type'] ?? '',
      isSafe: map['isSafe'] ?? true,
      confidence: (map['confidence'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filePath': filePath,
      'type': type,
      'isSafe': isSafe,
      'confidence': confidence,
    };
  }
}
