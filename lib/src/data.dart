import 'package:get/get.dart';
import 'package:mdigits/src/models/mdigits_data.dart';
import 'package:mdigits/src/models/trial_data.dart';
import 'package:mdigits/src/models/data_model.dart';

/// Data manager for MDigits
class Data extends GetxController {
  DataModel practiceData = DataModel();
  DataModel experimentalData = DataModel();

  /// Add data [participantID], [stim], [resp] from a single trial to
  /// the manager
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

  /// Exports the data collected during the session using a custom object named
  /// [MDigitsData]
  MDigitsData export() {
    MDigitsData data = MDigitsData(
      trialData: _trialData,
      startTime: _startTime,
      endTime: _endTime,
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
