import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/data.dart';
import 'package:mdigits/src/mdigits/mdigits_controller.dart';
import 'package:mdigits/src/mdigits/mdigits_view.dart';
import 'package:mdigits/src/config/config_user.dart';
import 'package:mdigits/src/models/mdigits_data.dart';

/// Present the appropriate screen based on the curren step
class MDigitsActivity extends StatelessWidget {
  final Data _data = Get.put(Data());
  late final MDigitsController _mDigitsController;
  late final ConfigUser _config;

  MDigitsActivity({super.key, required config}) {
    _config = Get.put(config);
    _mDigitsController = Get.put(MDigitsController());
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
                _config.isPractice = false;
                await Get.to(() => MDigitsView());
                _config.isPractice = true;
                MDigitsData mDigitsData = _data.export();
                Get.back(result: mDigitsData);
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
