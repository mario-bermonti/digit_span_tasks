import 'package:cognitive_data/databases/in_memory_db.dart';
import 'package:cognitive_data/models/trial.dart';
import 'package:cognitive_data/models/trial_type.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/session_type.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/digit_span_tasks_data.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_model.dart';

import '../config/session_trial_type_map.dart';

/// Data manager for DigitSpanTask.
/// Used for adding data, getting data for practice or experimental session,
/// and exporting data.
class DataManager extends GetxController {
  final InMemoryDB db = InMemoryDB();
  final DSConfig _config = Get.find();
  late final DateTime _startTime;
  late final DateTime _endTime;
  DataModel practiceData = DataModel();
  DataModel experimentalData = DataModel();

  /// Adds data from a single trial to the in memory db.
  /// Given a [stim] and [resp], it defines a [Trial] and adds it to the db.
  /// The trial data includes the participantID, sessionID, and the
  /// [SessionType] (practice vs experimental) from the [_config].
  void addTrial({
    required String stim,
    required String resp,
  }) {
    TrialType trialType = convertSessionToTrialType(_config.sessionType);
    Trial trial = Trial(
      stim: stim,
      response: resp,
      participantID: _config.userConfig.participantID,
      sessionID: _config.userConfig.sessionID,
      trialType: trialType,
    );
    db.addTrial(trial: trial);
  }

  /// Sets the start time for the session, but only if this is a practice phase.
  /// Practice and experimental phases are considered part of the same session
  /// so the start time for the practice phase is considered the beginning of
  /// the session.
  set startTime(DateTime time) {
    if (_config.sessionType == SessionType.practice) {
      _startTime = time;
    }
  }

  /// Sets the end time for the session, but only if this is a experimental
  /// phase. Practice and experimental phases are considered part of the same
  /// session so the end time for the experimental phase is considered the
  /// end of the session.
  set endTime(DateTime time) {
    if (_config.sessionType == SessionType.experimental) {
      _endTime = DateTime.now();
    }
  }

  /// Exports the data collected during the session.
  /// Returns a custom object named [DigitSpanTasksData] that includes data for the
  /// practice and experimental phase.
  DigitSpanTasksData export() {
    DigitSpanTasksData data = DigitSpanTasksData(
      practiceData: practiceData,
      experimentalData: experimentalData,
    );

    return data;
  }
}
