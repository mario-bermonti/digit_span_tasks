import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/data.dart';
import 'package:mdigits/src/mdigits/mdigits_view_experimental.dart';
import 'package:mdigits/src/mdigits/mdigits_view_practice.dart';
import 'package:mdigits/src/models/config.dart';

/// Present the appropriate screen based on the curren step
class MDigitsActivity extends StatelessWidget {
  MDigitsActivity({super.key, required config}) {
    final Config _config = Get.put(config);
    final Data _data = Get.put(Data());
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
                await Get.to(() => MDigitsViewPractice());
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
