import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeNotifier extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}