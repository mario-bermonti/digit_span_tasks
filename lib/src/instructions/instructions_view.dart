import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/instructions/instructions_controller.dart';

class InstructionsView extends StatelessWidget {
  InstructionsView({super.key});

  final InstructionsController instructionsController =
      Get.put(InstructionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                instructionsController.toNextScreen();
              },
              child: Text(
                'Comenzar',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
