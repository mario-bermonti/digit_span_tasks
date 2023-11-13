import 'package:get/get.dart';
import 'package:digit_span_tasks/src/components/activity/activity_controller.dart';
import 'package:digit_span_tasks/src/components/errors/errors.dart';
import 'package:digit_span_tasks/src/components/activity/task_step.dart';
import 'package:stimuli/errors.dart';
import 'package:stimuli/stimuli.dart';
import 'package:digit_span_tasks/src/components/config/app_config.dart';

/// Manage the stim
class StimController extends GetxController {
  late Stimuli _stimPractice;
  late Stimuli _stimExperimental;
  RxString currentDigit = ''.obs;
  late final ActivityController _activityController;
  final AppConfig _config = Get.find();

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
      throw GenericmdigitsException(e.toString());
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
  /// [_config.isPractice] flag
  Stimuli get stim {
    Stimuli stim =
        _config.isPractice == true ? _stimPractice : _stimExperimental;
    return stim;
  }
}
