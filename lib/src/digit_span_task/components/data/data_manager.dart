import 'package:cognitive_data/databases/in_memory_db.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/digit_span_tasks_data.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/trial_data.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_model.dart';

/// Data manager for DigitSpanTask.
/// Used for adding data, getting data for practice or experimental session,
/// and exporting data.
class DataManager extends GetxController {
  final InMemoryDB db = InMemoryDB();
  final DSConfig _config = Get.find();
  late final DateTime _startTime;
  DataModel practiceData = DataModel();
  DataModel experimentalData = DataModel();

  /// Add data [stim], [resp] from a single trial to
  /// the manager. Uses [isPractice] to get the data for the current phase.
  void addTrialData({
    required String stim,
    required String resp,
    required bool isPractice,
  }) {
    TrialData trialData = TrialData(
      stim: stim,
      response: resp,
    );
    DataModel data = getData(isPractice);
    data.trialData.add(trialData);
  }

  /// Sets the start time for the session, but only if this is a practice phase.
  /// Practice and experimental phases are considered part of the same session
  /// so the start time for the practice phase is considered the beginning of
  /// the session.
  set startTime(DateTime time) {
    if (_config.isPractice) {
      _startTime = time;
    }
  }

  /// Adds the time at which the session ended for the current
  /// phase (practice or experimental) based on the [isPractice] flag.
  void addEndTime(bool isPractice) {
    DataModel data = getData(isPractice);
    data.sessionData.endTime = DateTime.now();
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

  /// Returns the data for the current phase (practice or experimental) based on
  /// the [isPractice] flag.
  DataModel getData(bool isPractice) {
    DataModel data = isPractice == true ? practiceData : experimentalData;
    return data;
  }
}
