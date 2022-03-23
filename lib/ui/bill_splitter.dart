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
                  border: Border.all(color: mainColor),
                  borderRadius: BorderRadius.circular(defaultRadius)),
              child: Column(
                children: [
                  TextField(
                    controller: TextEditingController(text: "$_billValue zł"),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(labelText: "Bill value:"),
                    onChanged: _onBillValueChanged,
                  ),
                  const SizedBox(height: defaultSpace),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Number of persons:", style: defaultTextStyle),
                      Row(children: [
                        InkWell(
                          onTap: _onRemovePerson,
                          child: Container(
                            alignment: Alignment.center,
                            width: defaultButtonSize,
                            height: defaultButtonSize,
                            margin: const EdgeInsets.all(smallSpace),
                            decoration: BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(defaultRadius)),
                            child: const Text("-", style: defaultButtonTextStyle),
                          ),
                        ),
                        Text("$_numberOfPersons", style: defaultTextStyle),
                        InkWell(
                          onTap: _onAddPerson,
                          child: Container(
                            alignment: Alignment.center,
                            width: defaultButtonSize,
                            height: defaultButtonSize,
                            margin: const EdgeInsets.all(smallSpace),
                            decoration: BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(defaultRadius)),
                            child: const Text("+", style: defaultButtonTextStyle),
                          ),
                        )
                      ],
                      )
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
          ],
        ),
      ),
    );
  }

  void _onBillValueChanged(String billValue) {}

  void _onRemovePerson() {
    if (_numberOfPersons > 1) {
      setState(() => _numberOfPersons--);
    }
  }

  void _onAddPerson() {
    setState(() => _numberOfPersons++);
  }

  double _totalTip() {
    return 0.0;
  }

  void _onTipPercentageChange(double value) {
    setState(() => _tipPercentage = value.round());
  }

}
