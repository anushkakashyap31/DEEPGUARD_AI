class AppConstants {
  // Max file sizes (in bytes)
  static const int maxImageSize = 5 * 1024 * 1024; // 5 MB
  static const int maxVideoSize = 50 * 1024 * 1024; // 50 MB
  static const int maxAudioSize = 10 * 1024 * 1024; // 10 MB

  // Upload types
  static const String typeImage = "image";
  static const String typeVideo = "video";
  static const String typeAudio = "audio";

  // Detection status
  static const String statusSafe = "Safe";
  static const String statusFake = "Fake";
  static const String statusSuspicious = "Suspicious";
}
