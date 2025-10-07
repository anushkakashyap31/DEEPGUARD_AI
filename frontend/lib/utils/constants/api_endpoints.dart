class ApiEndpoints {
  static const String baseUrl = "https://your-api-domain.com/api";

  // Manual detection
  static const String detectImage = "$baseUrl/detect/image";
  static const String detectVideo = "$baseUrl/detect/video";
  static const String detectAudio = "$baseUrl/detect/audio";

  // Real-time detection
  static const String liveCallDetection = "$baseUrl/detect/live";

  // User endpoints
  static const String registerUser = "$baseUrl/user/register";
  static const String loginUser = "$baseUrl/user/login";
  static const String logoutUser = "$baseUrl/user/logout";

  // History
  static const String getDetectionHistory = "$baseUrl/history";
  static const String saveDetectionResult = "$baseUrl/history/save";
}
