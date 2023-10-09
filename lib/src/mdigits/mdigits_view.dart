import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/data.dart';
import 'package:mdigits/src/end/end_view.dart';
import 'package:mdigits/src/instructions/instructions_view.dart';
import 'package:mdigits/src/mdigits/mdigits_controller.dart';
import 'package:mdigits/src/models/settings.dart';
import 'package:mdigits/src/response/response_view.dart';
import 'package:mdigits/src/rest/rest_view.dart';
import 'package:mdigits/src/stim/stim_view.dart';
import 'package:mdigits/src/mdigits/task_step.dart';

/// Present the appropriate screen based on the curren step
class MDigitsView extends StatelessWidget {
  late final MDigitsController mDigits;

  /// Data manager
  final Data data = Get.put(Data());

  MDigitsView({super.key, required Config config}) {
    Get.put(config);
    mDigits = Get.put(MDigitsController());
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
