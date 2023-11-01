import 'package:get/get.dart';
import 'package:mdigits/src/config/user_config.dart';
import 'package:mdigits/src/randomize.dart';

class AppConfig extends GetxController {
  /// List of stim to present to the user
  late final List<String> stimListPractice;
  late final List<String> stimListExperimental;

  late bool isPractice = true;

  /// Unique id to identify all the participant's data
  late final String participantID;

  AppConfig({
    required UserConfig configUser,
  }) {
    stimListPractice = randomizeDigitsInSets(configUser.stimListPractice);
    stimListExperimental =
        randomizeDigitsInSets(configUser.stimListExperimental);
    participantID = configUser.participantID;
  }
}
