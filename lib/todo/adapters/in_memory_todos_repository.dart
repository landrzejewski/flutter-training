import '../api/todos_repository.dart';
import '../models/todo.dart';

class InMemoryTodosRepository implements TodosRepository {
  List<Todo> _todos = [];

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
