import 'package:get/get_state_manager/get_state_manager.dart';

class UserConfig extends GetxController {
  late final List<String> stimListPractice;
  late final List<String> stimListExperimental;

  /// Unique id to identify all the participant's data
  final String participantID;

  UserConfig(
      {required this.stimListPractice,
      required this.stimListExperimental,
      required this.participantID});
}
