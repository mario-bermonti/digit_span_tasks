import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/mdigits_controller.dart';
import 'package:mdigits/src/task_step.dart';

/// Manage responses
class ResponseController extends GetxController {
  TextEditingController textController = TextEditingController();
  final MDigitsController _mDigits = Get.find();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void submit() {
    String response = textController.text.trim();
    _mDigits.addTrialData(resp: response);
    textController.clear();
  }

  void toNextScreen() {
    MDigitsController mDigitsController = Get.find();
    if (mDigitsController.restStatusFollows()) {
      mDigitsController.status(TaskStep.rest);
    } else {
      mDigitsController.status(TaskStep.stim);
    }
  }
}
