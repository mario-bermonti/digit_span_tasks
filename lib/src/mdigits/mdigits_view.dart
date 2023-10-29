import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/data.dart';
import 'package:mdigits/src/mdigits/mdigits_view_experimental.dart';
import 'package:mdigits/src/mdigits/mdigits_view_practice.dart';

/// Present the appropriate screen based on the curren step
class MDigitsView extends StatelessWidget {
  MDigitsView({super.key, required config}) {
    Get.put(config);
    Get.put(Data());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                print('practice');
                await Get.to(() => MDigitsViewPractice());
                print('exp');
                await Get.to(() => MDigitsViewExperimental());
              },
              child: Text(
                'General instructions',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
