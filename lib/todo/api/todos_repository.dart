import '../models/todo.dart';

abstract class TodosRepository {
  Future<List<Todo>> load();

  Future save(List<Todo> todos);
}
