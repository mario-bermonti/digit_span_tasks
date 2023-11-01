import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mdigits/src/randomize.dart';

class ConfigUser extends GetxController {
  /// List of stim to present to the user
  late final List<String> stimListPractice;
  late final List<String> stimListExperimental;

  bool isPractice = true;

  /// Unique id to identify all the participant's data
  final String participantID;

  ConfigUser(
      {required stimListPractice,
      required stimListExperimental,
      required this.participantID}) {
    this.stimListPractice = randomizeDigitsInSets(stimListPractice);
    this.stimListExperimental = randomizeDigitsInSets(stimListExperimental);
  }
}
