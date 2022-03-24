import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:training/todo/models/app_state.dart';
import 'package:training/todo/selectors/selectors.dart';

class Loading extends StatelessWidget {
  final Widget Function(BuildContext context, bool isLoading) builder;
  const Loading({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      distinct: true,
      converter: (store) => isLoadingSelector(store.state),
      builder: builder,
    );
  }
}
