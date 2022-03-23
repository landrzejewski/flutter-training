import 'package:flutter/material.dart';

import 'theme.dart';

class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);

  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  var _billValue = 0.0;
  var _numberOfPersons = 1;
  var _tipPercentage = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bill splitter"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
        child: ListView(
          padding: const EdgeInsets.all(defaultSpace),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: const EdgeInsets.all(defaultSpace),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                  borderRadius: BorderRadius.circular(defaultRadius)),
              child: Column(
                children: [
                  TextField(
                    controller: TextEditingController(text: "$_billValue"),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(labelText: "Bill value:"),
                    onChanged: _onBillValueChanged,
                  ),
                  const SizedBox(height: defaultSpace),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Number of persons:", style: defaultTextStyle),
                      NumberField(onChange: _onNumberOfPersonsChange)
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tip", style: defaultTextStyle),
                      Padding(padding: const EdgeInsets.all(smallSpace), child: Text("${_totalTip()} zł", style: defaultTextStyle)),
                    ],
                  ),
                  Column(
                    children: [
                      Slider(
                          value: _tipPercentage.toDouble(),
                          onChanged: _onTipPercentageChange,
                          min: 0,
                          max: 70,
                          divisions: 7,
                          activeColor: mainColor,
                          inactiveColor: Colors.grey.shade500
                      ),
                      Text("$_tipPercentage %", style: defaultTextStyle)
                    ]
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultSpace),
            Center(child: Text("Value per person: ${_valuePerPerson()}", style: defaultTextStyle))
          ],
        ),
      ),
    );
  }

  void _onBillValueChanged(String billValue) {
    try {
      _billValue = double.parse(billValue);
    } catch (exception) {
      debugPrint("Invalid bill value");
    }
  }

  void _onNumberOfPersonsChange(int numberOfPersons) {
    setState(() => _numberOfPersons = numberOfPersons);
  }

  double _totalTip() {
    return (_billValue * _tipPercentage) / 100;
  }

  void _onTipPercentageChange(double value) {
    setState(() => _tipPercentage = value.round());
  }

  String _valuePerPerson() {
    final result = ((_totalTip() + _billValue) / _numberOfPersons).toStringAsFixed(2);
    return "$result zł";
  }

}

class NumberField extends StatefulWidget {
  final void Function(int)? onChange;
  const NumberField({Key? key, this.onChange}) : super(key: key);

  @override
  State<NumberField> createState() => _NumberFieldState(onChange);
}

class _NumberFieldState extends State<NumberField> {

  final void Function(int)? onChange;
  var _value = 1;

  _NumberFieldState(this.onChange);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
        CustomButton(text: "-", onTap: _onDecrement),
        Text("$_value", style: defaultTextStyle),
        CustomButton(text: "+", onTap: _onIncrement)
    ]);
  }

  void _onDecrement() {
    if (_value > 1) {
      setState(() => _value--);
      onChange?.call(_value);
    }
  }

  void _onIncrement() {
    setState(() => _value++);
    onChange?.call(_value);
  }

}


class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  const CustomButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: defaultButtonSize,
        height: defaultButtonSize,
        margin: const EdgeInsets.all(smallSpace),
        decoration: BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(defaultRadius)),
        child: Text(text, style: defaultButtonTextStyle),
      ),
    );
  }

}
