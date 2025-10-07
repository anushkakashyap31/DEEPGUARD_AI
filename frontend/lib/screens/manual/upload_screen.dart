import 'package:flutter/material.dart';
import 'processing_screen.dart';

class UploadScreen extends StatelessWidget {
  final String fileType;
  const UploadScreen({Key? key, required this.fileType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String label;
    switch (fileType) {
      case "image":
        label = "Image File";
        break;
      case "audio":
        label = "Audio File";
        break;
      case "video":
        label = "Video File";
        break;
      default:
        label = "File";
    }

    return Scaffold(
      appBar: AppBar(title: Text("Upload $label")),
      body: Center(
        child: ElevatedButton(
          child: Text("Start Analysis for $label"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProcessingScreen(fileType: fileType),
              ),
            );
          },
        ),
      ),
    );
  }
}
