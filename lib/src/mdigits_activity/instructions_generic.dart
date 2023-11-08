import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/common/spacing_holder.dart';

class InstructionGeneric extends StatelessWidget {
  final String text;

  const InstructionGeneric({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const BetweenWidgetsSpace(),
            ElevatedButton(
              onPressed: () => Get.back(),
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
