// image_analysis.dart
class ImageAnalysis {
  static Future<Map<String, dynamic>> analyze(String filePath) async {
    await Future.delayed(const Duration(seconds: 2));
    return {"status": "Fake", "confidence": 60.0};
  }
}
