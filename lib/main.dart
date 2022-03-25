import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:training/todo/adapters/shared_preferences_todos_repository.dart';
import 'todo/adapters/in_memory_todos_repository.dart';
import 'todo/app.dart';
import 'todo/middlewares/todos_store_middleware.dart';
import 'todo/models/app_state.dart';
import 'todo/reducers/app_state_reducer.dart';
import 'movies/fake_movies_provider.dart';
import 'movies/http_movies_provider.dart';
import 'movies/movies_service.dart';
import 'movies/movies_ui.dart';
import 'ui/bill_splitter.dart';
import 'ui/redux_counter.dart';
import 'ui/temperature_calculator.dart';
import 'ui/counter.dart';
import 'ui/material_hello_world.dart';

// void main() {
// runApp(const HelloWorld());
// runApp(const MaterialHelloWorld());
// runApp(const MaterialApp(home: Counter()));
// runApp(const MaterialApp(home: TemperatureCalculator()));
// runApp(const MaterialApp(home: BillSplitter()));
// runApp(const MaterialApp(home: Movies(moviesService: MoviesService(HttpMoviesProvider("https://raw.githubusercontent.com/landrzejewski/flutter-training/master/data.json")))));
// final store = Store<int>(counterReductor, initialState: 0);
//runApp(ReduxCounter(store: store));
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final repository = InMemoryTodosRepository();
  final repository = SharedPreferencesTodosRepository();
  runApp(TodoApp(store: Store<AppState>(appReducer, initialState: AppState(), middleware: createTodosStoreMiddleware(repository))));
}

// class HelloWorld extends StatelessWidget {
//   const HelloWorld({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         "HelloWorld",
//         textDirection: TextDirection.ltr,
//         style: TextStyle(color: Colors.blue, fontSize: 24),
//       ),
//     );
//   }
// }
