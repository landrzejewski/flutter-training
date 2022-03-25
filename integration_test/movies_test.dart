import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:training/movies/fake_movies_provider.dart';
import 'package:training/movies/movies_service.dart';
import 'package:training/movies/movies_ui.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  String? _getRowTitle(element) {
      final card = element.widget as Card;
      final listTitle = card.child as ListTile;
      final text = listTitle.title as Text;
      return text.data;
  }

  testWidgets("given user when select movie then movie details is shown", (WidgetTester tester) async {
      final moviesService = MoviesService(FakeMoviesProvider());
      await tester.pumpWidget(MaterialApp(home: Movies(moviesService: moviesService)));
      await tester.pumpAndSettle();
      final cards = find.byType(Card).evaluate().toList();
      expect(_getRowTitle(cards.first), "Rocky");
      await tester.tap(find.byWidget(cards.first.widget));
      await tester.pumpAndSettle();
      expect(find.text("1999 - Adventure"), findsOneWidget);
  });

}

// flutter test integration_test/movies_test.dart --no-sound-null-safety