import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    final Color _defaultColor = Colors.deepOrange.shade200;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade500,
        actions: [
          IconButton(onPressed: _printMessage, icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: InkWell(
            child: Text(
              "Counter value: $_counter",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  letterSpacing: 2,
                  color: _defaultColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              final snackBar = SnackBar(
                content: const Text("Hello!"),
                backgroundColor: _defaultColor,
                duration: const Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: _defaultColor,
          child: const Icon(Icons.plus_one),
          onPressed: () {
            _increment();
            debugPrint("$_counter");
          }),
    );
  }

  void _printMessage() {
    debugPrint("Button clicked");
  }

  void _increment() {
    setState(() => _counter++);
  }
}

/*
class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color _defaultColor = Colors.deepOrange.shade200;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade500,
        actions: [
          IconButton(onPressed: _printMessage, icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: InkWell(
            child: Text(
              "Counter value: 0",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  letterSpacing: 2,
                  color: _defaultColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              final snackBar = SnackBar(
                content: const Text("Hello!"),
                backgroundColor: _defaultColor,
                duration: const Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _defaultColor,
        child: const Icon(Icons.plus_one),
        onPressed: () => debugPrint("Button clicked"),
      ),
    );
  }

  void _printMessage() {
    debugPrint("Button clicked");
  }
}
*/
