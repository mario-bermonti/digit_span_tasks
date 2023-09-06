/// Returns a randomized list of sets of digits
/// [stim] list of sets to randomize
/// Returns a list of the same length as the original
List<String> randomizeDigitsInSets(List<String> stim) {
  List<String> stimRandomized = <String>[];
  for (String set in stim) {
    String setRandomized = randomizeSet(set);
    stimRandomized.add(setRandomized);
  }
  return stimRandomized;
}

/// Returns a randomized single digit sets
/// [set] Digit set to randomize
/// Returns a String of the same length as the original [set]
String randomizeSet(String set) {
  List<String> setList = set.split('');
  setList.shuffle();
  String setString = setList.join();
  return setString;
}
