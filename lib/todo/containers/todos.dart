import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../models/app_state.dart';
import '../models/todo.dart';
import '../widgets/todos_list.dart';

class Todos extends StatelessWidget {
  const Todos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(builder: (context, vm) => TodosList(todos: vm.todos), converter: _ViewModel.fromStore);
  }
}

class _ViewModel {
  final List<Todo> todos;
  final bool isLoading;

  _ViewModel(this.todos, this.isLoading);

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(store.state.todos, store.state.isLoading);
  }

}
