import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training/ui/header.dart';

void main() {
  testWidgets("has title", (WidgetTester tester) async {
    const title = "Hello";
    await tester.pumpWidget(const Header(title: title));
    final text = find.byType(Text);
    expect(text, findsOneWidget);
    final textElement = text.evaluate().single.widget as Text;
    expect(textElement.data, title);
  });
}