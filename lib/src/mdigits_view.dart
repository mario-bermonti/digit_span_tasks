import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/end/end_view.dart';
import 'package:mdigits/src/mdigits_controller.dart';
import 'package:mdigits/src/response/response_view.dart';
import 'package:mdigits/src/rest/rest_view.dart';
import 'package:mdigits/src/stim/stim_view.dart';
import 'package:mdigits/src/task_step.dart';

/// Controls the task sequence based on the curren step
class MDigitsView extends StatelessWidget {
  MDigitsView({super.key});

  final MDigitsController mDigits =
      Get.put(MDigitsController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (mDigits.status) {
        case TaskStep.stim:
          return StimView();
        case TaskStep.response:
          return ResponseView();
        case TaskStep.rest:
          return RestView();
        case TaskStep.completed:
          // TODO should data be processed here
          if (mDigits.processData != null) {
            mDigits.processData!(mDigits.data);
          }
          return const EndView();
        // Get.back();
      }
    });
  }
}
