import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:digit_span_tasks/src/digit_span_task/randomize.dart';

/// The [UserConfig] contains settings the user can use to modify the behavior
/// of the app.
class UserConfig extends GetxController {
  /// [stimListPractice] is the list of stimuli to be presented during the
  /// practice phase. The digits in the digit sets of [stimListPractice] are
  /// randomized (e.g., "123" may be turned into "213").
  late final List<String> stimListPractice;

  /// [stimListExperimental] is the list of stimuli to be presented during the
  /// experimental phase. The digits in the digit sets of [stimListExperimental]
  /// are randomized (e.g., "123" may be turned into "213").
  late final List<String> stimListExperimental;

  /// ID that uniquely identifies this participant's session.
  /// It will be used to pair the different data collected by [digit_span_tasks]
  /// for the participant's particular session. So it is essential that
  /// the [sessionID] is an unique identifier across all the sessions for this
  /// participant.
  final String sessionID;
  UserConfig({
    required stimListPractice,
    required stimListExperimental,
    required this.sessionID,
  }) {
    this.stimListPractice = randomizeDigitsInSets(stimListPractice);
    this.stimListExperimental = randomizeDigitsInSets(stimListExperimental);
  }
}
