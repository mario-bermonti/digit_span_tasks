import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/instructions/instructions_model.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/ui_components/instructions_text.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/ui_components/spacing.dart';
import 'package:digit_span_tasks/src/digit_span_task/digit_span_tasks_activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DigitSpanBackwards extends StatelessWidget {
  late final DSConfig _config;
  late final InstructionsModel _instructions;

  DigitSpanBackwards({super.key, required UserConfig config}) {
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

    instructions.practice = const TextInstructions(
      text: 'Comenzaremos practicando',
    );
    instructions.experimental = Column(children: const [
      TextInstructions(
        text: 'Terminamos la práctica',
      ),
      SpacingParagraph(),
      TextInstructions(
        text:
            'Toma un breve descanso y trabajaremos en los ejercicios principales',
      ),
    ]);
    instructions.reminderInTask = const TextInstructions(
      text:
          'Recuerda, escribe los números al revés al orden en que los veas (de atrás para adelante)',
    );
  }
}
