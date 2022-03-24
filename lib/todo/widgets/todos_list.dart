import 'package:flutter/material.dart';
import 'package:training/todo/containers/loading.dart';
import 'loading_indicator.dart';

import '../models/todo.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;
  const TodosList({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Loading(builder: (context, loading) {
      return loading
          ? const LoadingIndicator()
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Card(
                  child: ListTile(title: Text(todo.task)),
                );
              });
    });
  }
}
