import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum Actions { increment, decrement }

int counterReductor(int state, dynamic action) {
  if (action == Actions.increment) {
    return state + 1;
  }
  if (action == Actions.decrement) {
    return state - 1;
  }
  return state;
}

class ReduxCounter extends StatelessWidget {
  final Store<int> store;
  const ReduxCounter({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade200));
    return StoreProvider<int>(
        store: store,
        child: MaterialApp(
          home: Scaffold(
              appBar: AppBar(title: const Text("Counter")),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const StoreConnector(converter: _stateConverter, builder: _counterBuilder),
                    StoreConnector<int, VoidCallback>(
                        converter: (store) => () => store.dispatch(Actions.decrement),
                        builder: (context, callback) => TextButton(onPressed: callback, child: const Text("Decrement"), style: buttonStyle)),
                    StoreConnector<int, VoidCallback>(
                        converter: (store) => () => store.dispatch(Actions.increment),
                        builder: (context, callback) => TextButton(onPressed: callback, child: const Text("Increment"), style: buttonStyle))
                  ],
                ),
              )),
        ));
  }
}

String _stateConverter(Store<int> store) {
  return store.state.toString();
}

Widget _counterBuilder(BuildContext context, String count) {
  return Text("Counter value $count", style: const TextStyle(color: Colors.blue, fontSize: 24));
}
