import 'package:flutter/material.dart';

class MaterialHelloWorld extends StatelessWidget {
  const MaterialHelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.blue,
      child: Center(
        child: Text(
          "HelloWorld",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
