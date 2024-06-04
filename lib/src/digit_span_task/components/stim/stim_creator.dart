/// create all digit sets of all sizes
/// create all digit sets for the same size

/// Create single digit set of the specified [size]
String createDigitSet({required int size}) {
  if (size < 1) {
    throw ArgumentError('size must be larger than 0');
  }

  final List<String> digits = <String>[
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];
  digits.shuffle();
  List<String> digitsSelected = digits.sublist(0, size);
  return digitsSelected.join();
}
