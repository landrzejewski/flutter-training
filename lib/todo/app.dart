import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'actions/actions.dart';
import 'models/app_state.dart';
import 'widgets/home_screen.dart';

class TodoApp extends StatelessWidget {
  final Store<AppState> store;
  const TodoApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          routes: {
            TodosRoutes.home: (context) => HomeScreen(onInit: () => StoreProvider.of<AppState>(context).dispatch(LoadTodosAction()))
          },
        ));
  }
}

class TodosRoutes {
  static final home = '/';
  static final addTodo = '/addTodo';
}
