import 'package:digit_span_tasks/src/digit_span_task/components/instructions/instructions_model.dart';
import 'package:flutter/material.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/instructions/general_instructions.dart';
import 'package:get/get.dart';

class InstructionsExperimental extends StatelessWidget {
  final InstructionsModel _instructions = Get.find();

  InstructionsExperimental({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralInstructions(
      children: Column(
        children: [
          Text(
            _instructions.experimental,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          Text(
            'Trabajemos en los ejercicios principales',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
