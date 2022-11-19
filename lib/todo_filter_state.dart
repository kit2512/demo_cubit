import 'package:demo_cubit/todo.dart';

class TodoFilterState {
  final bool showCompleteOnlhy;
  final List<Todo> todos;

  const TodoFilterState(this.showCompleteOnlhy, this.todos);
}
