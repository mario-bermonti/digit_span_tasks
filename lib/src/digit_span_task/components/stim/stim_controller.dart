import 'package:digit_span_tasks/src/digit_span_task/components/config/session_type.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_controller.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/exceptions/errors.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/task_step.dart';
import 'package:stimuli/errors.dart';
import 'package:stimuli/stimuli.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';

/// Manage the stim
class StimController extends GetxController {
  late Stimuli _stimPractice;
  late Stimuli _stimExperimental;
  RxString currentDigit = ''.obs;
  late final ActivityController _activityController;
  final DSConfig _config = Get.find();

  @override
  onInit() async {
    await prepareStimPool();
    super.onInit();
    _activityController = Get.find();
  }

  /// Prepare stim pool to be used for both the practice and experimtnal phase.
  Future<void> prepareStimPool() async {
    try {
      _stimPractice = Stimuli(stimuli: _config.userConfig.stimListPractice);
      _stimExperimental =
          Stimuli(stimuli: _config.userConfig.stimListExperimental);
    } on StimFileAccessException catch (e) {
      throw GenericDigitSpanTasksException(e.toString());
    }
  }

  void prepareNextStim() {
    stim.next();
  }

  /// Presents the stim once to the participant and goes back after 1s ISI
  Future<void> presentStim() async {
    await _presentISI();
    await _presentIndividualStim(stim.currentStim);
    toNextScreen();
  }

  void toNextScreen() {
    _activityController.taskStep(TaskStep.response);
  }

  /// Present digits from the set individually to the participant
  Future<void> _presentIndividualStim(String stimSet) async {
    if (stimSet.isEmpty) {
      currentDigit('');
      return;
    } else {
      currentDigit(stimSet[0]);
      stimSet = stimSet.substring(1);
      await _presentISI();
      await _presentIndividualStim(stimSet);
    }
  }

  /// Present 1s ISI
  Future<void> _presentISI() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  /// Returns the [_stimPractice] or [_stimExperimental] depending on the
  /// [SessionType] flag
  Stimuli get stim {
    Stimuli stim;
    if (_config.sessionType == SessionType.practice) {
      stim = _stimPractice;
    } else {
      stim = _stimExperimental;
    }
    return stim;
  }
}
