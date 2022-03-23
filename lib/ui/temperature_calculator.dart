import 'package:flutter/material.dart';

class TemperatureCalculator extends StatefulWidget {
  const TemperatureCalculator({Key? key}) : super(key: key);

  @override
  State<TemperatureCalculator> createState() => _TemperatureCalculatorState();
}

class _TemperatureCalculatorState extends State<TemperatureCalculator> {
  var _celsius = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Calculator"),
          centerTitle: true,
          backgroundColor: Colors.blue),
      body: Container(
          margin: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(onChanged: _onTemperatureChange),
              const SizedBox(height: 25),
              Text(
                "Temperature $_celsius°",
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                    letterSpacing: 2,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }

  void _onTemperatureChange(String newValue) {
    setState(() {
      _celsius = (double.parse(newValue) - 32) * 5 / 6;
    });
  }
}
