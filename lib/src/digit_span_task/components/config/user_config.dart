import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:digit_span_tasks/src/digit_span_task/randomize.dart';

import 'session_type.dart';

/// The [UserConfig] contains settings the user can use to modify the behavior
/// of the app.
class UserConfig extends GetxController {
  /// [stimList] is the list of stimuli to be presented to participants.
  /// The digits in the digit sets of [stimList]
  /// are randomized (e.g., "123" may be turned into "213").
  late final List<String> stimList;

  /// ID that uniquely identifies this participant's session.
  /// It will be used to pair the different data collected by [digit_span_tasks]
  /// for the participant's particular session. So it is essential that
  /// the [sessionID] is an unique identifier across all the sessions for this
  /// participant.
  final String sessionID;

  /// ID that uniquely identifies this participant.
  /// It will be used to pair the different data collected by [digit_span_tasks]
  /// for the participant. So it is essential that the [participantID] is an
  /// unique identifier across all participant.
  final String participantID;

  /// This flag is used to identify the types of trials.
  ///
  /// It is needed because the [cognitive_data] package identifies trials as
  /// either either practice or experimental.
  final SessionType sessionType;

  UserConfig({
    required stimList,
    required this.sessionID,
    required this.participantID,
    required this.sessionType,
  }) {
    this.stimList = randomizeDigitsInSets(stimList);
  }
}
