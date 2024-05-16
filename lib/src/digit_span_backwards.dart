import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/instructions/instructions_model.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/ui_components/instructions_text.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/ui_components/spacing.dart';
import 'package:digit_span_tasks/src/digit_span_task/digit_span_tasks_activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DigitSpanBackwards {
  /// Allows customizing the task.
  final UserConfig config;

  DigitSpanBackwards({required this.config});

  /// Main entry point to the task.
  Future<DigitSpanTaskData> run() async {
    _configTask(config);
    DigitSpanTaskData data = await Get.to(DigitSpanTasksActivity());
    Get.deleteAll();
    return data;
  }

  void _configTask(config) {
    final _config = Get.put(DSConfig(userConfig: config));
    final InstructionsModel _instructions = Get.put(InstructionsModel());
    _updateInstructions(_instructions);
  }
}

void _updateInstructions(InstructionsModel instructions) {
  instructions.introduction = Column(
    children: const [
      TextInstructions(
        text:
            'Recuerda los números al revés al orden en que los veas (de atrás para adelante)',
      ),
      SpacingParagraph(),
      TextInstructions(
        text: 'Ejemplo:',
      ),
      TextInstructions(
        text: 'si ves 827,',
      ),
      TextInstructions(
        text: 'escribe 728',
      ),
    ],
  );
}
