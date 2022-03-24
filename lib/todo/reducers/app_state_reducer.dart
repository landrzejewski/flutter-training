
import 'package:training/todo/reducers/loading_reducer.dart';
import 'package:training/todo/reducers/todos_reducer.dart';

import '../models/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    todos: todosReducer(state.todos, action)
  );
}
