import 'package:flutter/material.dart';
import 'package:training/ui/temperature_calculator.dart';
import 'ui/counter_app.dart';
import 'ui/material_hello_world.dart';

void main() {
  // runApp(const HelloWorld());
  // runApp(const MaterialHelloWorld());
  // runApp(const MaterialApp(home: CounterApp()));
  runApp(const MaterialApp(home: TemperatureCalculator()));
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "HelloWorld",
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.blue, fontSize: 24),
      ),
    );
  }
}
