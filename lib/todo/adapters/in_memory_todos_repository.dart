import '../api/todos_repository.dart';
import '../models/todo.dart';

class InMemoryTodosRepository implements TodosRepository {
  List<Todo> _todos = [
    Todo("Learn dart")
  ];

  @override
  Future<List<Todo>> load() {
    return Future.value(_todos);
  }

  @override
  Future save(List<Todo> todos) {
    _todos = todos;
    return Future.value();
  }

}
