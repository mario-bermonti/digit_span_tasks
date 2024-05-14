import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/instructions/instructions_model.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/ui_components/instructions_text.dart';
import 'package:digit_span_tasks/src/digit_span_task/digit_span_tasks_activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DigitSpanForward extends StatelessWidget {
  late final DSConfig _config;
  late final InstructionsModel _instructions;

  DigitSpanForward({super.key, required UserConfig config}) {
    _config = Get.put(DSConfig(userConfig: config));
    _instructions = Get.put(InstructionsModel());
  }

  @override
  Widget build(BuildContext context) {
    updateInstructions(_instructions, context);
    return DigitSpanTasksActivity();
  }

  void updateInstructions(
      InstructionsModel instructions, BuildContext context) {
    instructions.introduction = const TextInstructions(
      text: 'Recuerda los números en el orden en que los veas',
    );
  }
}
