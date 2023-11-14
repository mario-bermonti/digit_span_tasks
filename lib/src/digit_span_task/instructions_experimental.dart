import 'package:flutter/material.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/instructions/general_instructions.dart';

class InstructionsExperimental extends StatelessWidget {
  const InstructionsExperimental({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralInstructions(
      children: Column(
        children: [
          Text(
            'Terminamos la práctica',
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
