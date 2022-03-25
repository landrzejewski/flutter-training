import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Battery extends StatefulWidget {
  const Battery({Key? key}) : super(key: key);

  @override
  State<Battery> createState() => _BatteryState();
}

class _BatteryState extends State<Battery> {
  static const platform = MethodChannel('pl.training/battery');

  var _batteryLevel = "";

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      _getBatteryLevel().then((batteryLevel) => setState(() => _batteryLevel = batteryLevel));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(_batteryLevel, textDirection: TextDirection.ltr,
            style: const TextStyle(color: Colors.blue, fontSize: 24)));
  }

  Future<String> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    return batteryLevel;
  }

}
