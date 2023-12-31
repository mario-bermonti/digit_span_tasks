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

  UserConfig({
    required stimListPractice,
    required stimListExperimental,
  }) {
    this.stimListPractice = randomizeDigitsInSets(stimListPractice);
    this.stimListExperimental = randomizeDigitsInSets(stimListExperimental);
  }
}
