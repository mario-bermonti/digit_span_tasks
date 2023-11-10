import 'package:get/get.dart';
import 'package:mdigits/src/components/data/mdigits_data.dart';
import 'package:mdigits/src/components/data/mdigits_data_phase.dart';
import 'package:mdigits/src/components/data/trial_data.dart';
import 'package:mdigits/src/components/data/data_model.dart';

/// Data manager for MDigits.
/// Used for adding data, getting data for practice or experimental session,
/// and exporting data.
class DataManager extends GetxController {
  DataModel practiceData = DataModel();
  DataModel experimentalData = DataModel();

  /// Add data [participantID], [stim], [resp] from a single trial to
  /// the manager. Uses [isPractice] to get the data for the current phase.
  void addTrialData({
    required String participantID,
    required String stim,
    required String resp,
    required bool isPractice,
  }) {
    TrialData trialData = TrialData(
      participantID: participantID,
      stim: stim,
      response: resp,
    );
    DataModel data = getData(isPractice);
    data.trialData.add(trialData);
  }

  /// Adds the time at which the session started for the current
  /// phase (practice or experimental) based on the [isPractice] flag.
  void addStartTime(bool isPractice) {
    DataModel data = getData(isPractice);
    data.startTime = DateTime.now();
  }

  /// Adds the time at which the session ended for the current
  /// phase (practice or experimental) based on the [isPractice] flag.
  void addEndTime(bool isPractice) {
    DataModel data = getData(isPractice);
    data.endTime = DateTime.now();
  }

  /// Exports the data collected during the session.
  /// Returns a custom object named [MDigitsData] that includes data for the
  /// practice and experimental phase.
  MDigitsData export() {
    MDigitsDataPhase practiceDataSharing = MDigitsDataPhase(
      trialData: practiceData.trialData,
      startTime: practiceData.startTime,
      endTime: practiceData.endTime,
    );

    MDigitsDataPhase experimentalDataSharing = MDigitsDataPhase(
      trialData: experimentalData.trialData,
      startTime: experimentalData.startTime,
      endTime: experimentalData.endTime,
    );

    MDigitsData data = MDigitsData(
      practiceData: practiceDataSharing,
      experimentalData: experimentalDataSharing,
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
