import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/instructions/instructions_controller.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/ui_components/screen.dart';

class InstructionsView extends StatelessWidget {
  InstructionsView({super.key});

  final InstructionsController _instructionsController =
      Get.put(InstructionsController());

  @override
  Widget build(BuildContext context) {
    return Screen(
      children: Column(
        children: <Widget>[
          Text(
            '''Recuerda, escribe los números en el orden en que los veas''',
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
