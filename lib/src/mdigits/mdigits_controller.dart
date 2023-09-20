import 'package:get/get.dart';
import 'package:mdigits/src/mdigits/task_step.dart';
import 'package:mdigits/src/stim/stim_controller.dart';
import 'package:mdigits/src/models/trial_data.dart';
import 'package:mdigits/src/randomize.dart';

/// Controls the task sequence
/// The task sequence which includes stim, response, rest, end
class MDigitsController extends GetxController {
  /// Provides access and manages the stimuli
  late StimController _stimuli;

  /// Data for all trials
  /// Used to provide data to app
  final List<TrialData> data = <TrialData>[];

  /// Identifies the step the task currently is in
  Rx<TaskStep> taskStep = TaskStep.instructions.obs;

  /// List of stim to present to the user
  late final List<String> stimList;

  /// Unique id to identify all the participant's data
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
  bool _stimStatusFollows() =>
      (taskStep.value == TaskStep.rest) ||
      (taskStep.value == TaskStep.instructions);
  bool restStatusFollows() =>
      _stimuli.stim.stimCountUsed != 0 && _stimuli.stim.stimCountUsed % 2 == 0;
  bool _completedStatusFollows() => _stimuli.stim.stimCountRemaining == 0;

  /// Setup everything needed to start the task sequence
  Future<void> setup() async {
    _stimuli = Get.put(StimController(stimList: stimList), permanent: true);
    await _stimuli.prepareStimPool();
  }

  Future<void> endSession() async {
    List<TrialData> datatoReturn = List<TrialData>.from(data);
    await reset();
    Get.back(result: datatoReturn);
  }

  /// Reset mDigits so it can be used again repeatedly
  Future<void> reset() async {
    data.clear();
    await setup();
    taskStep(TaskStep.instructions);
  }
}
