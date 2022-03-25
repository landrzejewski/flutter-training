import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/todo/models/todo.dart';

import '../api/todos_repository.dart';

class SharedPreferencesTodosRepository implements TodosRepository {

  final String todosKey = 'todos';

  @override
  Future<List<Todo>> load() async {
    final preferences = await SharedPreferences.getInstance();
    final json = preferences.getString(todosKey) ?? "[]";
    return _fromJson(json);
  }

  @override
  Future save(List<Todo> todos) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(todosKey, _toJson(todos));
  }

  String _toJson(List<Todo> todos) => jsonEncode(todos.map(_toMap).toList());

  List<Todo> _fromJson(String json) => List<Todo>.from(jsonDecode(json).map(_toTodo));

  Map<String, dynamic> _toMap(Todo todo) => {
    'id': todo.id,
    'task': todo.task,
    'note': todo.note,
    'complete': todo.complete
  };

  Todo _toTodo(dynamic todoMap) {
    return Todo(
        todoMap['task'] ?? "",
        complete: todoMap["complete"],
        note: todoMap["note"],
        id: todoMap["id"]
    );
  }

}
