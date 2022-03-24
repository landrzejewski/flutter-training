import 'package:redux/redux.dart';

import '../actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, TodosLoadedAction>(_setLoading),
  TypedReducer<bool, TodosNotLoadedAction>(_setLoading)
]);

bool _setLoading(bool state, dynamic action) {
  return false;
}
