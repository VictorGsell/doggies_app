import 'dart:async';
import 'package:doggies_app/BLoC/bloc.dart';
import 'package:doggies_app/models/dog_model.dart';
import 'package:doggies_app/services/dog_service.dart';
import 'package:doggies_app/BLoC/events/refresh_event.dart';

class DogBloc implements Bloc {
  final DogService _service = DogService();
  StreamController<List<DogModel>> _dogsController = StreamController<List<DogModel>>.broadcast();
  StreamController<RefreshEvent> _refreshEventController = StreamController<RefreshEvent>();

  DogBloc() {
    _refreshEventController.stream.listen(refresh);
    refresh(null);
    fetchDogs();
  }

  Stream<List<DogModel>> get dogsStream => _dogsController.stream;
  Sink<RefreshEvent> get refreshEventSink => _refreshEventController.sink;
  bool get isRefreshEventSinkClosed => _refreshEventController.isClosed;
  bool get isDogsStreamClosed => _dogsController.isClosed;

  Future<void> fetchDogs() async {
    try {
      await _service.fetch();
      refresh(null);
    } catch (error) {
      if (!_dogsController.isClosed)
        _dogsController.sink.addError(error);
    }
  }

  void refresh(_) {
    if (_service.isLoaded && !_dogsController.isClosed)
      _dogsController.sink.add(_service.dogs);
  }

  @override
  void init() {
    if (isDogsStreamClosed)
      _dogsController = StreamController<List<DogModel>>.broadcast();
    if (isRefreshEventSinkClosed) {
      _refreshEventController = StreamController<RefreshEvent>();
      _refreshEventController.stream.listen(refresh);
    }
  }

  @override
  void dispose() {
    _dogsController.close();
    _refreshEventController.close();
  }
}
