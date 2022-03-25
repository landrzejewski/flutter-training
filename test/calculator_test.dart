import 'package:flutter_test/flutter_test.dart';
import 'package:training/calculator.dart';

void main() {

  final Calculator calculator = Calculator();

  setUp(() => print("Before each"));

  tearDown(() => print("After each"));

  setUpAll(() => print("Before all"));

  tearDownAll(() => print("After all"));

  group("given two numbers", () {

    test(" when add then returns their sum", () {
      const firstNumber = 1;
      const secondNumber = 2;
      final actual = calculator.add(firstNumber, secondNumber);
      expect(actual, firstNumber + secondNumber);
    });

    test(" when subtract then returns their difference", () {
      const firstNumber = 1;
      const secondNumber = 2;
      final actual = calculator.substract(firstNumber, secondNumber);
      expect(actual, firstNumber - secondNumber);
    }, timeout: const Timeout(Duration(minutes: 1)));

    test("and divisor equals zero when divide then throws exception", () {
      expect(() => calculator.divide(2, 0), throwsException);
    }, skip: true);

  });

  test("given number when square then returns double value", () async {
    expect(await calculator.square(3), 9);
  });

}