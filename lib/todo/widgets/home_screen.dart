import 'package:flutter/material.dart';
import 'package:training/todo/app.dart';

import '../containers/todos.dart';

class HomeScreen extends StatefulWidget {
  final void Function() onInit;
  const HomeScreen({Key? key, required this.onInit}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todos")),
      body: const Todos(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, TodosRoutes.addTodo),
        child: const Icon(Icons.add),
      ),
    );
  }
}
