import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/data.dart';
import 'package:mdigits/src/mdigits/task_step.dart';
import 'package:mdigits/src/models/mdigits_data.dart';
import 'package:mdigits/src/stim/stim_controller.dart';

/// Controls the task sequence
/// The task sequence which includes stim, response, rest, end
class MDigitsController extends GetxController {
  /// Data Manager
  final Data _data = Get.find();

  /// Provides access and manages the stimuli
  late final StimController _stimuli;

  /// Identifies the step the task currently is in
  Rx<TaskStep> taskStep = TaskStep.instructions.obs;

  MDigitsController();

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

      /// This check is needed to garantee that mdigits doesn't
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
    _data.endTime = TimeOfDay.now();
    MDigitsData mDigitsData = _data.export();
    Get.back(result: mDigitsData);
  }
}
