List<String> randomizeDigitsInSets(List<String> stim) {
  List<String> stimRandomized = <String>[];
  for (String set in stim) {
    print(set);
    String setString = randomizeSet(set);
    stimRandomized.add(setString);
    print(setString);
  }
  return stimRandomized;
}

String randomizeSet(String set) {
  List<String> setList = set.split('');
  setList.shuffle();
  String setString = setList.join();
  return setString;
}
