/// Randomizes the digits in the sets of digits.
/// It accepts a list of sets to randomize [stim] and the returns the list
/// of digit sets with their digits randomized.
List<String> randomizeDigitsInSets(List<String> stim) {
  final List<String> stimRandomized = <String>[];
  for (String set in stim) {
    String setRandomized = _randomizeSet(set);
    stimRandomized.add(setRandomized);
  }
  return stimRandomized;
}

/// Randomizes the digits in a digit sets.
/// It accepts a digit set to randomize [set]
/// Returns the digit sets with its digits randomized.
String _randomizeSet(String set) {
  final List<String> setList = set.split('');
  setList.shuffle();
  String setString = setList.join();
  return setString;
}
