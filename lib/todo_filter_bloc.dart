import 'dart:async';

import 'package:demo_cubit/todo_filter_state.dart';

import 'todo.dart';

List<Todo> demoTodos = [for (int i = 1; i <= 10; i++) Todo("Job $i", i.isOdd)];

class TodoFilterBloc {
  final _data = demoTodos;

  TodoFilterState _state = TodoFilterState(false, demoTodos);

  final StreamController<bool> _eventController =
      StreamController<bool>.broadcast();
  final StreamController<TodoFilterState> _stateController =
      StreamController<TodoFilterState>.broadcast();

  Stream<TodoFilterState> get stream => _stateController.stream;

  void add(bool event) {
    _eventController.add(event);
  }

  TodoFilterBloc() {
    _stateController.add(_state);
    _eventController.stream.listen(_filterTodo);
  }

  void _filterTodo(bool event) {
    if (event) {
      final newTodos = _data.where((element) => element.complete).toList();
      _state = TodoFilterState(event, newTodos);
      _stateController.add(_state);
    } else {
      final newTodos = _data;
      _state = TodoFilterState(event, newTodos);
      _stateController.add(_state);
    }
  }
}
