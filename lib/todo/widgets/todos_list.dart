import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;
  const TodosList({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Card(
            child: ListTile(
              title: Text(todo.task)
            ),
          );
        });
  }
}
