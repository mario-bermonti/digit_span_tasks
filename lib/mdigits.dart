import 'package:get/get.dart';
import 'package:mdigits/activity/step.dart';
import 'package:mdigits/activity/stim_controller.dart';
import 'package:mdigits/activity/trial_response_view.dart';
import 'package:mdigits/activity/trial_stim_view.dart';
import 'package:mdigits/end/end_view.dart';
import 'package:mdigits/errors/errors.dart';
import 'package:mdigits/rest/rest_view.dart';

/// Controls the task sequence
/// The sequence includes stim presentation, response, rest, end
class MDigits extends GetxController {
  /// Provides access and manages the stimuli
  late final StimController _stimuli;

  /// Global task start time
  final DateTime _timeStart = DateTime.now();

  // late final DataBase _database;

  /// Session  number for current participant
  // late final int _sessionNumber;

  /// Identifies the step the task currently is in
  Step _status = Step.stim;

  final List<String> stimList;

  MDigits({required this.stimList});

  @override
  onInit() async {
    await _setup();
    super.onInit();
  }

  @override
  onReady() {
    run();
  }

  /// Add trial data to the db
  // void addTrialData({required String result}) {
  //   _database.addTrialData(
  //     participantId: _participantId,
  //     stim: _stimuli.stim.currentStim,
  //     resp: result,
  //     sessionNumber: _sessionNumber,
  //   );
  // }

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
      _stimuli.stim.stimCountUsed != 0 && _stimuli.stim.stimCountUsed % 5 == 0;
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
    await _stimuli.prepareStim();
  }

  /// Controls the task sequence based on the curren step
  void run() {
    print('run');
    switch (_status) {
      case Step.stim:
        Get.to(TrialStimView());
        _updateStep();
        break;
      case Step.response:
        Get.to(TrialResponseView());
        _updateStep();
        break;
      case Step.rest:
        Get.to(RestView());
        _updateStep();
        break;
      case Step.completed:
        // _saveData();
        Get.to(const EndView());
        return;
      default:
        run();
    }
  }
}
