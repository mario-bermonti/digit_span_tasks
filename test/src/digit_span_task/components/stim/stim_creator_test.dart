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

  group(
    "createDigitSetOfSize",
    () {
      test(
        "given size = 2 and setCount = 2, return a list of 2 strings, each of 2 digits",
        () {
          final List<String> digitSets =
              createDigitSetOfSize(size: 2, setCount: 2);
          expect(digitSets.length, 2);
          expect(digitSets.first.length, 2);
        },
      );
      test(
        "given size = 5 and setCount = 3, return a list of 3 strings, each of 5 digits",
        () {
          final List<String> digitSets =
              createDigitSetOfSize(size: 5, setCount: 3);
          expect(digitSets.length, 3);
          expect(digitSets.first.length, 5);
        },
      );
    },
  );
}
