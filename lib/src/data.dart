import 'package:get/get.dart';
import 'package:mdigits/src/models/mdigits_data.dart';
import 'package:mdigits/src/models/mdigits_data_phase.dart';
import 'package:mdigits/src/models/trial_data.dart';
import 'package:mdigits/src/models/data_model.dart';

/// Data manager for MDigits
class Data extends GetxController {
  DataModel practiceData = DataModel();
  DataModel experimentalData = DataModel();

  /// Add data [participantID], [stim], [resp] from a single trial to
  /// the manager. Use [isPractice] to get the data for the current phase.
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
    DataModel data = getDataForPhase(isPractice);
    data.trialData.add(trialData);
  }

  void addStartTime(bool isPractice) {
    DataModel data = getDataForPhase(isPractice);
    data.startTime = DateTime.now();
  }

  void addEndTime(bool isPractice) {
    DataModel data = getDataForPhase(isPractice);
    data.endTime = DateTime.now();
  }

  /// Exports the data collected during the session using a custom object named
  /// [MDigitsData]
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

  /// Get the data for the current phase (practice or experimental) based on
  /// the [isPractice] flag.
  DataModel getDataForPhase(bool isPractice) {
    DataModel data = isPractice == true ? practiceData : experimentalData;
    return data;
  }
}
