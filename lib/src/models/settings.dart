import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mdigits/src/randomize.dart';

class Config extends GetxController {
  /// List of stim to present to the user
  late final List<String> stimList;

  /// Unique id to identify all the participant's data
  final String participantID;

  Config({required stimList, required this.participantID}) {
    this.stimList = randomizeDigitsInSets(stimList);
  }
}
