import 'package:flutter/material.dart';

class SavedPostProvider extends ChangeNotifier {
  final List<String> _savedIds = [];

  List<String> get savedIds => _savedIds;

  void toggle(String id) {
    if (_savedIds.contains(id)) {
      _savedIds.remove(id);
    } else {
      _savedIds.add(id);
    }
    notifyListeners();
  }

  bool isSaved(String id) => _savedIds.contains(id);
}
