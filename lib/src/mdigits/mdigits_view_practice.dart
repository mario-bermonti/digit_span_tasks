import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/end/end_view.dart';
import 'package:mdigits/src/instructions/instructions_view.dart';
import 'package:mdigits/src/mdigits/mdigits_controller.dart';
import 'package:mdigits/src/models/settings.dart';
import 'package:mdigits/src/response/response_view.dart';
import 'package:mdigits/src/rest/rest_view.dart';
import 'package:mdigits/src/stim/stim_view.dart';
import 'package:mdigits/src/mdigits/task_step.dart';

/// Present the appropriate screen based on the curren step
class MDigitsViewPractice extends StatelessWidget {
  final Config config;
  late final MDigitsController mDigits;

  MDigitsViewPractice({super.key, required this.config}) {
    mDigits = Get.put(MDigitsController(config));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (mDigits.taskStep.value) {
        case TaskStep.instructions:
          return InstructionsView();
        case TaskStep.stim:
          return StimView();
        case TaskStep.response:
          return ResponseView();
        case TaskStep.rest:
          return RestView();
        case TaskStep.completed:
          return EndView();
      }
    });
  }
}