import 'package:demo_cubit/todo_filter_bloc.dart';
import 'package:demo_cubit/todo_filter_state.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final todoFilterBloc = TodoFilterBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
            actions: [
              StreamBuilder<TodoFilterState>(
                  stream: todoFilterBloc.stream,
                  builder: (context, snapshot) {
                    final check = snapshot.data?.showCompleteOnlhy;
                    return Switch.adaptive(
                      value: check ?? false,
                      onChanged: (check) {
                        todoFilterBloc.add(check);
                      },
                    );
                  }),
            ],
          ),
          body: StreamBuilder<TodoFilterState>(
            stream: todoFilterBloc.stream,
            builder: (_, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              final todos = snapshot.data?.todos;
              return ListView.builder(
                  itemCount: todos?.length,
                  itemBuilder: (context, index) {
                    final todo = todos?[index];
                    return ListTile(
                      title: Text(todo!.title),
                      trailing: Checkbox(
                        value: todo.complete,
                        onChanged: (_) {},
                      ),
                    );
                  });
            },
          )),
    );
  }
}
