import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:digit_span_tasks/src/digit_span_task/randomize.dart';

import 'session_type.dart';

/// The [UserConfig] contains settings the user can use to modify the behavior
/// of the app.
class UserConfig extends GetxController {
  /// Size of smallest digit set
  final int minStimSize;

  /// Size of largest digit set
  final int maxStimSize;

  /// Number of sets to create for each size
  final int countEachSize;

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

  /// Instructions to be presented during the rest periods.
  ///
  /// Any [Widget] can be used.
  final Widget restInstructions;

  UserConfig({
    required this.sessionID,
    required this.participantID,
    required this.sessionType,
    required this.restInstructions,
    required this.minStimSize,
    required this.maxStimSize,
    required this.countEachSize,
  });
}
