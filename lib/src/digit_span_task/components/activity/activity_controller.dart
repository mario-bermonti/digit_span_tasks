import 'package:digit_span_tasks/src/digit_span_task/components/config/session_type.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_manager.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/task_step.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/stim/stim_controller.dart';

/// Controls the task sequence.
/// The task sequence which includes instructions, stim, response, rest, end
class ActivityController extends GetxController {
  final DataManager _data = Get.find();

  /// Provides access and manages the stimuli
  late final StimController _stimuli;

  /// Identifies the step the task currently is in
  Rx<TaskStep> taskStep = TaskStep.instructions.obs;

  final DSConfig _config = Get.find();

  @override
  void onInit() {
    super.onInit();
    _stimuli = Get.put(StimController());
  }

  /// End the task [TaskStep.completed], present the rest period [TaskStep.rest]
  /// or continue with trials [TaskStep.stim] depending on the current
  /// state of [_stimuli].
  void endRestOrContinueTask() {
    var stim = _stimuli.stim;

    if (stim.stimCountRemaining == 0) {
      taskStep(TaskStep.completed);

      /// This check is needed to garantee that DigitSpanTask doesn't
      /// get stuck in rest
    } else if (taskStep.value == TaskStep.rest) {
      taskStep(TaskStep.stim);
    } else if ((stim.stimCountUsed != 0) && (stim.stimCountUsed % 2 == 0)) {
      taskStep(TaskStep.rest);

      /// This catch all is needed because not all conditions to update to stim
      /// can be handle explicitly before checking for rest
    } else {
      taskStep(TaskStep.stim);
    }
  }

  Future<void> endSession() async {
    _data.endTime = DateTime.now();
    await reset();
    Get.back();
  }

  /// Resets the important settings so another session can be run.
  Future<void> reset() async {
    taskStep(TaskStep.instructions);
    _config.sessionType = SessionType.practice;
  }
}
