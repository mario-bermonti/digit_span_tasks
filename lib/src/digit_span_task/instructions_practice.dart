import 'package:digit_span_tasks/src/digit_span_task/components/instructions/instructions_model.dart';
import 'package:flutter/material.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/instructions/general_instructions.dart';
import 'package:get/get.dart';

class InstructionsPractice extends StatelessWidget {
  final InstructionsModel _instructions = Get.find();

  InstructionsPractice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralInstructions(
      children: Text(
        _instructions.practice,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
