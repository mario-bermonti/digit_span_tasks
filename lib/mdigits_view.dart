import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/mdigits.dart';

class MDigitsView extends StatelessWidget {
  MDigitsView({super.key});

  final MDigits mDigits = Get.put(MDigits(), permanent: true);
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
