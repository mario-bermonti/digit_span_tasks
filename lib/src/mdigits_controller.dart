import 'package:get/get.dart';
import 'package:mdigits/src/step.dart';
import 'package:mdigits/src/stim/stim_controller.dart';
import 'package:mdigits/src/response/response_view.dart';
import 'package:mdigits/src/stim/stim_view.dart';
import 'package:mdigits/src/end/end_view.dart';
import 'package:mdigits/src/models/trial_data.dart';
import 'package:mdigits/src/randomize.dart';
import 'package:mdigits/src/rest/rest_view.dart';

/// Controls the task sequence
/// The sequence includes stim presentation, response, rest, end
class MDigitsController extends GetxController {
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

  late final List<String> stimList;
  late final String participantID;
  // @override
  // onInit() async {
  //   await setup();
  //   super.onInit();
  // }

  late Function(List<TrialData> value)? processData;

  // MDigits({
  //   required List<String> stimList,
  //   required this.participantID,
  //   randomizeDigits = false,
  //   this.processData,
  // }) {
  //   if (randomizeDigits) {
  //     this.stimList = randomizeDigitsInSets(stimList);
  //   } else {
  //     this.stimList = stimList;
  //   }
  // }
  MDigitsController() {
    stimList = randomizeDigitsInSets(['01', '234', '56789']);
    participantID = '000';
    processData = print;
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
  Future<void> setup() async {
    _stimuli = Get.put(StimController(stimList: stimList), permanent: true);
    await _stimuli.prepareStimPool();
  }

  /// Controls the task sequence based on the curren step
  void run() {
    switch (_status) {
      case Step.stim:
        Get.off(() => StimView());
        _updateStep();
        break;
      case Step.response:
        Get.off(ResponseView());
        _updateStep();
        break;
      case Step.rest:
        Get.off(RestView());
        _updateStep();
        break;
      case Step.completed:
        // _saveData();
        Get.off(const EndView());
        if (processData != null) {
          processData!(data);
        }
        Get.back();
        return;
      default:
        run();
    }
  }
}