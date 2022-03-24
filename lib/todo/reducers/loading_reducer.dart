import 'package:redux/redux.dart';

import '../actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, TodosLoadedAction>((state, action) => false),
  TypedReducer<bool, TodosNotLoadedAction>((state, action) => false),
  TypedReducer<bool, LoadTodosAction>((state, action) => true)
]);
