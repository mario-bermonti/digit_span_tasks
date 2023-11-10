import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/components/data/data_manager.dart';
import 'package:mdigits/src/components/end/end_view.dart';
import 'package:mdigits/src/components/instructions/instructions_view.dart';
import 'package:mdigits/src/components/activity/activity_controller.dart';
import 'package:mdigits/src/components/config/app_config.dart';
import 'package:mdigits/src/components/response/response_view.dart';
import 'package:mdigits/src/components/rest/rest_view.dart';
import 'package:mdigits/src/components/stim/stim_view.dart';
import 'package:mdigits/src/components/activity/task_step.dart';

/// Present the appropriate screen based on the curren step
class ActivityView extends StatelessWidget {
  final ActivityController mDigits = Get.find();
  final DataManager data = Get.find();
  final AppConfig _config = Get.find();

  ActivityView({super.key});

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
