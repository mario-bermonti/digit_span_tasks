import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/mdigits_controller.dart';

class MDigitsView extends StatelessWidget {
  MDigitsView({super.key});

  final MDigitsController mDigits =
      Get.put(MDigitsController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await mDigits.setup();
                mDigits.run();
              },
              child: Text(
                'mDigits',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
