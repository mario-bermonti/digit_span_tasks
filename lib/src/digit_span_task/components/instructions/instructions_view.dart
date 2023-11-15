import 'package:digit_span_tasks/src/digit_span_task/components/instructions/instructions_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/instructions/instructions_controller.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/ui_components/screen.dart';

class InstructionsView extends StatelessWidget {
  final InstructionsModel _instructions = Get.find();

  InstructionsView({super.key});

  final InstructionsController _instructionsController =
      Get.put(InstructionsController());

  @override
  Widget build(BuildContext context) {
    return Screen(
      children: Column(
        children: <Widget>[
          Text(
            _instructions.reminderInTask,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              _instructionsController.toNextScreen();
            },
            child: Text(
              'Comenzar',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
