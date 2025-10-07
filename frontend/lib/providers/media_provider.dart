import 'package:flutter/material.dart';
import '../models/media_result.dart';

class MediaProvider with ChangeNotifier {
  final List<MediaResult> _mediaResults = [];

  // 🔹 Getters
  List<MediaResult> get mediaResults => List.unmodifiable(_mediaResults);

  // 🔹 Add a new media result
  void addMediaResult(MediaResult result) {
    _mediaResults.add(result);
    notifyListeners();
  }

  // 🔹 Remove a media result
  void removeMediaResult(String id) {
    _mediaResults.removeWhere((res) => res.id == id);
    notifyListeners();
  }

  // 🔹 Clear all media results
  void clearResults() {
    _mediaResults.clear();
    notifyListeners();
  }
}
