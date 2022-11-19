import 'dart:async';

class CounterBloc {
  int _state = 0;

  final StreamController<int> _eventController = StreamController<int>();
  final StreamController<int> _stateController = StreamController<int>();

  Stream<int> get stream => _stateController.stream;

  void add(int event) {
    _eventController.add(event);
  }

  CounterBloc() {
    _stateController.add(_state);
    _eventController.stream.listen((event) {
      _increment(event);
    });
  }

  void _increment(int event) {
    _state += event;
    _stateController.add(_state);
  }
}
