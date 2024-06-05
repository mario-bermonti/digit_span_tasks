import 'dart:math';

import 'package:digit_span_tasks/src/digit_span_task/components/stim/stim_creator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('createDigitSet', () {
    test('given size = 2, return a string of 2 digits', () {
      final String digits = createDigitSet(size: 2);

      expect(digits.length, 2);
    });

    test(
      "given size = 0, throw an exception",
      () {
        expect(() => createDigitSet(size: 0), throwsArgumentError);
      },
    );
  });
}
