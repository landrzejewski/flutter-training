import 'dart:io';

import '../api/todos_repository.dart';
import '../models/todo.dart';

class InMemoryTodosRepository implements TodosRepository {
  final List<Todo> _todos = [Todo("Learn dart")];

  @override
  Future<List<Todo>> load() {
    return Future.delayed(const Duration(seconds: 2), () => _todos);
  }

  @override
  Future save(Todo todo) {
    _todos.add(todo);
    return Future.value();
  }
}
