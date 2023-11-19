import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/app_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/instructions/instructions_model.dart';
import 'package:digit_span_tasks/src/digit_span_task/digit_span_tasks_activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DigitSpanBackwards extends StatelessWidget {
  late final AppConfig _config;
  late final InstructionsModel _instructions;

  DigitSpanBackwards({super.key, required UserConfig config}) {
    _config = Get.put(AppConfig(userConfig: config));
    _instructions = Get.put(InstructionsModel());
  }

  @override
  Widget build(BuildContext context) {
    updateInstructions(_instructions, context);
    return DigitSpanTasksActivity();
  }

  void updateInstructions(
      InstructionsModel instructions, BuildContext context) {
    instructions.introduction = Text(
      'Recuerda los números al revés al orden en que los veas',
      style: Theme.of(context).textTheme.titleLarge,
    );
    instructions.practice = Text(
      'Comenzaremos practicando',
      style: Theme.of(context).textTheme.titleLarge,
    );
    instructions.experimental = Column(children: [
      Text(
        'Terminamos la práctica',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      Text(
        'Toma un breve descanso y trabajaremos en los ejercicios principales',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    ]);
    instructions.reminderInTask = Text(
      'Recuerda, escribe los números al revés al orden en que los veas',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
