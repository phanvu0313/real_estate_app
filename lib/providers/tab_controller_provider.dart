import 'package:flutter/material.dart';

class TabControllerProvider extends ChangeNotifier {
  int _currentTab = 0;

  int get currentTab => _currentTab;

  void setTab(int index) {
    _currentTab = index;
    notifyListeners();
  }
}

class TabManagerControllerProvider extends ChangeNotifier {
  int _currentTab = 0;

  int get currentTab => _currentTab;

  void setTab(int index) {
    _currentTab = index;
    notifyListeners();
  }
}
