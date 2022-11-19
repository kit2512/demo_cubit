import 'dart:async';

class CounterCubit {
  int state = 0;

  final _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  CounterCubit() {
    _controller.add(state);
  }

  void increment() {
    state++;
    _controller.add(state);
  }
}
