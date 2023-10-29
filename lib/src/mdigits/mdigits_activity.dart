import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/data.dart';
import 'package:mdigits/src/mdigits/mdigits_controller.dart';
import 'package:mdigits/src/mdigits/mdigits_view.dart';
import 'package:mdigits/src/models/config.dart';

/// Present the appropriate screen based on the curren step
class MDigitsActivity extends StatelessWidget {
  MDigitsActivity({super.key, required config}) {
    final Config _config = Get.put(config);
    final Data _data = Get.put(Data());
    final MDigitsController mDigitsController = Get.put(MDigitsController());
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
                await Get.to(() => MDigitsView());
                await Get.to(() => MDigitsView());
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
