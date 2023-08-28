import 'package:get/get.dart';
import 'package:mdigits/activity/step.dart';
import 'package:mdigits/activity/trial_stim/stim_controller.dart';
import 'package:mdigits/activity/trial_response/trial_response_view.dart';
import 'package:mdigits/activity/trial_stim/trial_stim_view.dart';
import 'package:mdigits/end/end_view.dart';
import 'package:mdigits/models/trial_data.dart';
import 'package:mdigits/rest/rest_view.dart';

import 'activity/begin_view.dart';

/// Controls the task sequence
/// The sequence includes stim presentation, response, rest, end
class MDigits extends GetxController {
  /// Provides access and manages the stimuli
  late final StimController _stimuli;

  /// Data for all trials
  /// Used to provide data to app
  final List<TrialData> data = <TrialData>[];

  /// Global task start time
  final DateTime _timeStart = DateTime.now();

  // late final DataBase _database;

  /// Session  number for current participant
  // late final int _sessionNumber;

  /// Identifies the step the task currently is in
  Step _status = Step.stim;

  final List<String> stimList;
  final String participantID;
  @override
  onInit() async {
    await _setup();
    super.onInit();
  }

  Function(List<TrialData> value) processData;

  MDigits({
    required this.stimList,
    required this.participantID,
    required this.processData,
  });

  @override
  onReady() {
    Get.to(() => BeginView(beginFunction: run));
  }

  void addTrialData({required String resp}) {
    TrialData trialData = TrialData(
      participantID: participantID,
      stim: _stimuli.stim.currentStim,
      response: resp,
    );
    data.add(trialData);
  }

  // TODO improve name of conditions checks?
  /// TODO can presenting stim next be improved? Current implementation seems
  /// weird
  /// Update the current task step so the [run()] can continue the sequence
  void _updateStep() {
    if (_responseStatusFollows()) {
      _status = Step.response;
    } else if (_completedStatusFollows()) {
      _status = Step.completed;
    } else if (_stimStatusFollows()) {
      _status = Step.stim;
    } else if (_restStatusFollows()) {
      _status = Step.rest;
    } else {
      _status = Step.stim;
    }
  }

  bool _responseStatusFollows() => _status == Step.stim;
  bool _stimStatusFollows() => _status == Step.rest;
  bool _restStatusFollows() =>
      _stimuli.stim.stimCountUsed != 0 && _stimuli.stim.stimCountUsed % 2 == 0;
  bool _completedStatusFollows() => _stimuli.stim.stimCountRemaining == 0;

  /// Save session and device data
  // void _saveData() {
  //   /// Global session end time
  //   final DateTime timeEnd = DateTime.now();

  //   _database.addSessionData(
  //       sessionNumber: _sessionNumber,
  //       participantId: _participantId,
  //       timeStart: _timeStart,
  //       timeEnd: timeEnd);
  //   _database.addDeviceData(
  //     participantId: _participantId,
  //     sessionNumber: _sessionNumber,
  //   );
  //   _database.saveData();
  // }

  /// Setup everything needed to start the task sequence
  Future<void> _setup() async {
    _stimuli = Get.put(StimController(stimList: stimList));
    await _stimuli.prepareStimPool();
  }

  /// Controls the task sequence based on the curren step
  void run() {
    switch (_status) {
      case Step.stim:
        Get.off(() => TrialStimView());
        _updateStep();
        break;
      case Step.response:
        Get.off(TrialResponseView());
        _updateStep();
        break;
      case Step.rest:
        Get.off(RestView());
        _updateStep();
        break;
      case Step.completed:
        // _saveData();
        Get.off(const EndView());
        processData(data);
        Get.back();
        return;
      default:
        run();
    }
  }
}
