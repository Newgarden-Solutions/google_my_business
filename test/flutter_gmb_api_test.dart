import 'package:flutter_gmb_api/flutter_gmb_api.dart';
import 'package:flutter_test/flutter_test.dart';

class Calculator {
  num addOne(num a) {
    return a + 1;
  }
}

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
