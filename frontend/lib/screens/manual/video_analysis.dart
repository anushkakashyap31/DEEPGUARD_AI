// video_analysis.dart
class VideoAnalysis {
  static Future<Map<String, dynamic>> analyze(String filePath) async {
    await Future.delayed(const Duration(seconds: 3));
    return {"status": "Safe", "confidence": 88.0};
  }
}
