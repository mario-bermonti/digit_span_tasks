import 'package:get/get.dart';
import 'package:mdigits/src/mdigits/task_step.dart';
import 'package:mdigits/src/stim/stim_controller.dart';
import 'package:mdigits/src/models/trial_data.dart';
import 'package:mdigits/src/randomize.dart';

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
  Rx<TaskStep> taskStep = TaskStep.instruction.obs;

  late final List<String> stimList;
  late final String participantID;

  @override
  onInit() async {
    await setup();
    super.onInit();
  }

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
  ///  Update the current task step so the [run()] can continue the sequence
  void updateStep() {
    if (_responseStatusFollows()) {
      taskStep(TaskStep.response);
    } else if (_completedStatusFollows()) {
      taskStep(TaskStep.completed);
    } else if (_stimStatusFollows()) {
      taskStep(TaskStep.stim);
    } else if (restStatusFollows()) {
      taskStep(TaskStep.rest);
    } else {
      taskStep(TaskStep.stim);
    }
  }

  bool _responseStatusFollows() => taskStep.value == TaskStep.stim;
  bool _stimStatusFollows() => taskStep.value == TaskStep.rest;
  bool restStatusFollows() =>
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
  // void run() {
  //   switch (status) {
  //     case TaskStep.stim:
  //       Get.off(() => StimView());
  //       _updateStep();
  //       break;
  //     case TaskStep.response:
  //       Get.off(ResponseView());
  //       _updateStep();
  //       break;
  //     case TaskStep.rest:
  //       Get.off(RestView());
  //       _updateStep();
  //       break;
  //     case TaskStep.completed:
  //       // _saveData();
  //       Get.off(const EndView());
  //       if (processData != null) {
  //         processData!(data);
  //       }
  //       Get.back();
  //       return;
  //     default:
  //       run();
  //   }
  // }
}
