import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/data.dart';
import 'package:mdigits/src/mdigits/task_step.dart';
import 'package:mdigits/src/models/mdigits_data.dart';
import 'package:mdigits/src/models/settings.dart';
import 'package:mdigits/src/stim/stim_controller.dart';

/// Controls the task sequence
/// The task sequence which includes stim, response, rest, end
class MDigitsController extends GetxController {
  final Config config = Get.find();

  /// Data Manager
  final Data data = Get.find();

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

  /// Update the current task step to control flow of MDigits.
  /// Each step is handled explicitly and the order checks is important
  void updateStep() {
    bool stimStepFollows = (taskStep.value == TaskStep.rest);

    bool restStepFollows = (_stimuli.stim.stimCountUsed != 0) &&
        (_stimuli.stim.stimCountUsed % 2 == 0);

    if (taskStep.value == TaskStep.stim) {
      taskStep(TaskStep.response);
    } else if (_stimuli.stim.stimCountRemaining == 0) {
      taskStep(TaskStep.completed);
    } else if (stimStepFollows) {
      taskStep(TaskStep.stim);
    } else if (restStepFollows) {
      taskStep(TaskStep.rest);
    } else {
      taskStep(TaskStep.stim);
    }
  }

  Future<void> endSession() async {
    data.endTime = TimeOfDay.now();
    MDigitsData mDigitsData = data.export();
    Get.back(result: mDigitsData);
  }
}
