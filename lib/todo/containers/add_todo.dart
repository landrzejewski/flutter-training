import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/app_state.dart';
import '../widgets/add_todo_screen.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnTodoSave>(
        converter: (Store<AppState> store) => (todo) => store.dispatch(AddTodoAction(todo)),
        builder: (BuildContext context, OnTodoSave onSave) => AddTodoScreen(onSave: onSave)
    );
  }
}
