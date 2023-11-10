import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/components/ui_components/default_appbar.dart';
import 'package:mdigits/src/components/instructions/instructions_controller.dart';

class InstructionsView extends StatelessWidget {
  InstructionsView({super.key});

  final InstructionsController _instructionsController =
      Get.put(InstructionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context: context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '''
              Recuerda, escribe los números en el orden en que los veas
              ''',
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
      ),
    );
  }
}