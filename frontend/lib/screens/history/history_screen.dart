import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  // Example data (replace with real history from Firestore or local storage)
  final List<Map<String, String>> _historyData = const [
    {
      'type': 'Image',
      'result': 'Safe',
      'confidence': '95%',
      'timestamp': '2025-10-03 12:00'
    },
    {
      'type': 'Audio',
      'result': 'Suspicious',
      'confidence': '62%',
      'timestamp': '2025-10-03 12:30'
    },
    {
      'type': 'Video',
      'result': 'Fake',
      'confidence': '20%',
      'timestamp': '2025-10-03 13:00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detection History"),
        backgroundColor: Colors.indigo,
      ),
      body: _historyData.isEmpty
          ? const Center(
              child: Text(
                "No history available.",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _historyData.length,
              itemBuilder: (context, index) {
                final item = _historyData[index];
                Color resultColor;

                switch (item['result']) {
                  case 'Safe':
                    resultColor = Colors.green;
                    break;
                  case 'Fake':
                    resultColor = Colors.red;
                    break;
                  case 'Suspicious':
                    resultColor = Colors.orange;
                    break;
                  default:
                    resultColor = Colors.grey;
                }

                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(
                      Icons.insert_drive_file,
                      color: resultColor,
                    ),
                    title: Text("${item['type']} - ${item['result']}"),
                    subtitle: Text(
                        "Confidence: ${item['confidence']}\nTime: ${item['timestamp']}"),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        // TODO: Add delete functionality
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
