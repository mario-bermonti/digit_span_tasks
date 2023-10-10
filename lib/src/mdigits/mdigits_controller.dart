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
  final StimController _stimuli = Get.put(StimController());

  /// Identifies the step the task currently is in
  Rx<TaskStep> taskStep = TaskStep.instructions.obs;

  MDigitsController();

  /// Update the current task step to control flow of MDigits.
  /// Each step is handled explicitly and the order checks is important
  void updateStep() {
    if (_responseStatusFollows()) {
      taskStep(TaskStep.response);
    } else if (_completedStatusFollows()) {
      taskStep(TaskStep.completed);
    } else if (_stimStatusFollows()) {
      taskStep(TaskStep.stim);
    } else if (restStatusFollows()) {
      taskStep(TaskStep.rest);
    }
  }

  bool _responseStatusFollows() => taskStep.value == TaskStep.stim;
  bool _stimStatusFollows() =>
      (taskStep.value == TaskStep.rest) ||
      (taskStep.value == TaskStep.instructions) ||
      (taskStep.value == TaskStep.response);
  bool restStatusFollows() =>
      _stimuli.stim.stimCountUsed != 0 && _stimuli.stim.stimCountUsed % 2 == 0;
  bool _completedStatusFollows() => _stimuli.stim.stimCountRemaining == 0;

  Future<void> endSession() async {
    data.endTime = TimeOfDay.now();
    MDigitsData mDigitsData = data.export();
    Get.back(result: mDigitsData);
  }
}
