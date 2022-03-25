import 'package:flutter/material.dart';

class Battery extends StatelessWidget {
  const Battery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      child: const Text("Battery: ", style: const TextStyle(color: Colors.blue, fontSize: 24)),
    ));
  }
}
