import 'dart:io';
import 'package:file_picker/file_picker.dart';
import '../utils/constants/constants.dart';

class FilePickerUtil {
  /// Pick an image file
  static Future<File?> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      if (file.lengthSync() <= AppConstants.maxImageSize) {
        return file;
      }
      throw Exception("Image exceeds maximum size of 5MB");
    }
    return null;
  }

  /// Pick a video file
  static Future<File?> pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      if (file.lengthSync() <= AppConstants.maxVideoSize) {
        return file;
      }
      throw Exception("Video exceeds maximum size of 50MB");
    }
    return null;
  }

  /// Pick an audio file
  static Future<File?> pickAudio() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      if (file.lengthSync() <= AppConstants.maxAudioSize) {
        return file;
      }
      throw Exception("Audio exceeds maximum size of 10MB");
    }
    return null;
  }
}
