import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../api/todos_repository.dart';
import '../models/app_state.dart';

List<Middleware<AppState>> createTodosStoreMiddleware(TodosRepository repository) {
  final loadTodos = _createLoadTodos(repository);
  final saveTodos = _createSaveTodos(repository);

  return [
    TypedMiddleware<AppState, LoadTodosAction>(loadTodos),
    TypedMiddleware<AppState, AddTodoAction>(saveTodos)
  ];
}

Middleware<AppState> _createLoadTodos(TodosRepository repository) {

  return (Store<AppState> store, dynamic action, NextDispatcher next) {
    repository.load().then((todos) => store.dispatch(TodosLoadedAction(todos)));
    next(action);
  };
}

Middleware<AppState> _createSaveTodos(TodosRepository repository) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);
    repository.save(action.todo);
  };
}
