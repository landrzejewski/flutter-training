import 'package:uuid/uuid.dart';

class Todo {
  final String task;
  final String id;
  final String note;
  final bool complete;

  Todo(this.task, {this.complete = false, this.note = "", String? id}) : id = id ?? const Uuid().v4();
}
