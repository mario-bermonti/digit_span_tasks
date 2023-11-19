import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/app_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/instructions/instructions_model.dart';
import 'package:digit_span_tasks/src/digit_span_task/digit_span_tasks_activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DigitSpanForward extends StatelessWidget {
  late final AppConfig _config;

  DigitSpanForward({super.key, required UserConfig config}) {
    _config = Get.put(AppConfig(userConfig: config));
    InstructionsModel instructions = Get.put(InstructionsModel());

    updateInstructions(instructions);
  }

  void updateInstructions(InstructionsModel instructions) {
    instructions.introduction =
        const Text('Recuerda los números en el orden en que los veas');
    instructions.practice = const Text('Comenzaremos practicando');
    instructions.experimental = Column(children: const [
      Text('Terminamos la práctica'),
      Text(
          'Toma un breve descanso y trabajaremos en los ejercicios principales'),
    ]);
    instructions.reminderInTask =
        const Text('Recuerda, escribe los números en el orden en que los veas');
  }

  @override
  Widget build(BuildContext context) {
    return DigitSpanTasksActivity();
  }
}
