import 'todo.dart';

class AppState {
  final bool isLoading;
  final List<Todo> todos;

  AppState({this.isLoading = false, this.todos = const []});

  AppState copy({bool? isLoading, List<Todo>? todos}) {
    return AppState(isLoading: isLoading ?? this.isLoading, todos: todos ?? this.todos);
  }
}
