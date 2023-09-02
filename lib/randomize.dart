List<String> randomizeDigitsInSets(List<String> stim) {
  List<String> stimRandomized = <String>[];
  for (String set in stim) {
    List<String> setList = set.split('');
    setList.shuffle();
    String setString = setList.join();
    stimRandomized.add(setString);
  }
  return stimRandomized;
}
