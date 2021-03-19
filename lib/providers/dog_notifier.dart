import 'dart:async';

import 'package:doggies_app/models/dog_model.dart';
import 'package:doggies_app/services/dog_service.dart';
import 'package:flutter/foundation.dart';

class DogNotifier extends ChangeNotifier {
  DogService _service = DogService();

  DogNotifier() {
  }

  List<DogModel> _dogs;

  List<DogModel> get dogs => _dogs;

  set dogs(List<DogModel> value) {
    _dogs = value;
    notifyListeners();
  }

  double _progress;

  double get progress => _progress;

  set progress(double value) {
    _progress = value;
    notifyListeners();
  }

  Future<void> fetchDogs({bool notify = false}) async {
    try {
        if (!_service.isProgressStreamClosed)
          _service.progressStream.listen((value) => progress = value);
        await _service.fetch();
        if (notify) dogs = _service.dogs;

    } catch (error) {
      print(error);
      rethrow;
    }
  }

  void disposeProgress() {
    _service.disposeProgress();
  }
}
