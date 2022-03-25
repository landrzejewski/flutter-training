import 'package:flutter/material.dart';

import '../models/todo.dart';

typedef OnTodoSave = void Function(Todo);

class AddTodoScreen extends StatefulWidget {
  final OnTodoSave onSave;
  const AddTodoScreen({Key? key, required this.onSave}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  var _task = "";

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300));
    return Scaffold(
        appBar: AppBar(title: const Text("Todos")),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            decoration: const InputDecoration(labelText: "Task"),
            onChanged: (task) => _task = task,
          ),
          TextButton(onPressed: () => onSave(context), child: const Text("Save"), style: buttonStyle)
        ])));
  }

  void onSave(BuildContext context) {
    final todo = Todo(_task);
    widget.onSave(todo);
    Navigator.pop(context);
  }

}
