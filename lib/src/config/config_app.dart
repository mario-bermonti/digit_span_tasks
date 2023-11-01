import 'package:get/get.dart';
import 'package:mdigits/src/config/config_user.dart';
import 'package:mdigits/src/randomize.dart';

class ConfigApp extends GetxController {
  /// List of stim to present to the user
  late final List<String> stimListPractice;
  late final List<String> stimListExperimental;

  late bool isPractice = true;

  /// Unique id to identify all the participant's data
  late final String participantID;

  ConfigApp({
    required ConfigUser configUser,
  }) {
    stimListPractice = randomizeDigitsInSets(configUser.stimListPractice);
    stimListExperimental =
        randomizeDigitsInSets(configUser.stimListExperimental);
    participantID = configUser.participantID;
  }
}
