import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../utils/constants/api_endpoints.dart';

class ApiServices {
  /// 🔹 Upload image for deepfake analysis
  Future<Map<String, dynamic>> analyzeImage(File imageFile) async {
    final request = http.MultipartRequest('POST', Uri.parse(ApiEndpoints.detectImage));
    request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    final response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return json.decode(respStr);
    } else {
      throw Exception('Image analysis failed: ${response.statusCode}');
    }
  }

  /// 🔹 Upload audio for deepfake/fraud detection
  Future<Map<String, dynamic>> analyzeAudio(File audioFile) async {
    final request = http.MultipartRequest('POST', Uri.parse(ApiEndpoints.detectAudio));
    request.files.add(await http.MultipartFile.fromPath('file', audioFile.path));

    final response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return json.decode(respStr);
    } else {
      throw Exception('Audio analysis failed: ${response.statusCode}');
    }
  }

  /// 🔹 Upload video for deepfake detection
  Future<Map<String, dynamic>> analyzeVideo(File videoFile) async {
    final request = http.MultipartRequest('POST', Uri.parse(ApiEndpoints.detectVideo));
    request.files.add(await http.MultipartFile.fromPath('file', videoFile.path));

    final response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return json.decode(respStr);
    } else {
      throw Exception('Video analysis failed: ${response.statusCode}');
    }
  }
}
