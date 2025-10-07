import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../utils/constants/api_endpoints.dart';

class CallService {
  /// 🔹 Upload recorded call for fraud/deepfake detection
  Future<Map<String, dynamic>> analyzeCall(File audioFile) async {
    final request = http.MultipartRequest('POST', Uri.parse(ApiEndpoints.detectAudio));
    request.files.add(await http.MultipartFile.fromPath('file', audioFile.path));

    final response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return json.decode(respStr);
    } else {
      throw Exception('Call analysis failed: ${response.statusCode}');
    }
  }
}
