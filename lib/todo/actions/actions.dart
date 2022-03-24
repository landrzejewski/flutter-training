import '../models/todo.dart';

class LoadTodosAction {}

class TodosNotLoadedAction {}

class TodosLoadedAction {
  final List<Todo> todos;

  TodosLoadedAction(this.todos);
}

class AddTodoAction {
  final Todo todo;

  AddTodoAction(this.todo);
}
