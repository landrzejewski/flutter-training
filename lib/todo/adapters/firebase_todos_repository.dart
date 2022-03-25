import 'package:flutter/cupertino.dart';
import 'package:training/todo/api/todos_repository.dart';
import 'package:training/todo/models/todo.dart';
import 'package:training/todo/models/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTodosRepository implements TodosRepository {

  final CollectionReference collection = FirebaseFirestore.instance.collection(
      "todos");

  @override
  Future<List<Todo>> load() async {
    final snapshot = await collection.get();
    return Future(() => snapshot.docs.map(_toTodo).toList());
  }

  @override
  Future save(List<Todo> todos) async {
    return Future(() => todos.map(_toMap).forEach((element) => collection.doc(element["id"]).set(element)));
  }

  Map<String, dynamic> _toMap(Todo todo) =>
      {
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