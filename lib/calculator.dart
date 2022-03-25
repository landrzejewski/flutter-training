class Calculator {

  int add(int leftHandSide, int rightHandSide) {
    return leftHandSide + rightHandSide;
  }

  int substract(int leftHandSide, int rightHandSide) {
    return leftHandSide - rightHandSide;
  }

  int divide(int leftHandSide, int rightHandSide) {
    if (rightHandSide == 0) {
      throw Exception("Division by zero");
    }
    return (leftHandSide / rightHandSide).round();
  }

  Future<int> square(int value) {
    return Future.delayed(const Duration(seconds: 3), () => value * value);
  }

}