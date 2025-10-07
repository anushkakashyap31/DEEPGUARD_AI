import 'package:flutter/material.dart';
import 'upload_screen.dart';

class ManualModeScreen extends StatelessWidget {
  const ManualModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            "Manual Deepfake Detection",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          _buildUploadCard(
            context,
            icon: Icons.image,
            label: "Upload Image",
            type: "image",
          ),
          const SizedBox(height: 16),
          _buildUploadCard(
            context,
            icon: Icons.audiotrack,
            label: "Upload Audio",
            type: "audio",
          ),
          const SizedBox(height: 16),
          _buildUploadCard(
            context,
            icon: Icons.video_library,
            label: "Upload Video",
            type: "video",
          ),
        ],
      ),
    );
  }

  Widget _buildUploadCard(BuildContext context,
      {required IconData icon, required String label, required String type}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.indigo),
        title: Text(label, style: const TextStyle(fontSize: 18)),
        subtitle: const Text("Select a file to verify authenticity"),
        trailing: ElevatedButton(
          child: const Text("Choose File"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => UploadScreen(fileType: type),
              ),
            );
          },
        ),
      ),
    );
  }
}
