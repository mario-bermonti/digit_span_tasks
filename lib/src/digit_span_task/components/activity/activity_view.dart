import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_manager.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/end/end_view.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_controller.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/response/response_view.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/rest/rest_view.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/stim/stim_view.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/task_step.dart';

/// Present the appropriate screen based on the current step
class ActivityView extends StatelessWidget {
  final DataManager data = Get.put(DataManager());
  final ActivityController mDigits = Get.put(ActivityController());
  // final DataManager data = Get.find();
  final DSConfig _config = Get.find();

  ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    data.startTime = DateTime.now();
    return Obx(() {
      switch (mDigits.taskStep.value) {
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
