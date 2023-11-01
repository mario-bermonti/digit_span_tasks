import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/data.dart';
import 'package:mdigits/src/end/end_view.dart';
import 'package:mdigits/src/instructions/instructions_view.dart';
import 'package:mdigits/src/mdigits/mdigits_controller.dart';
import 'package:mdigits/src/config/config.dart';
import 'package:mdigits/src/response/response_view.dart';
import 'package:mdigits/src/rest/rest_view.dart';
import 'package:mdigits/src/stim/stim_view.dart';
import 'package:mdigits/src/mdigits/task_step.dart';

/// Present the appropriate screen based on the curren step
class MDigitsView extends StatelessWidget {
  final MDigitsController mDigits = Get.find();
  final Data data = Get.find();
  final Config _config = Get.find();

  MDigitsView({super.key});

  @override
  Widget build(BuildContext context) {
    data.addStartTime(_config.isPractice);
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
