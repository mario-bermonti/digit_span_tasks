import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/config/app_config.dart';
import 'package:mdigits/src/data.dart';
import 'package:mdigits/src/mdigits/mdigits_controller.dart';
import 'package:mdigits/src/mdigits/mdigits_view.dart';
import 'package:mdigits/src/models/mdigits_data.dart';

/// Runs all mdigits activity beginning with the practice trials and then the
/// experimental trials. It returns the data from the session when mdigits
/// finishes; includes data for practice and experimental trials.
class MDigitsActivity extends StatelessWidget {
  final Data _data = Get.put(Data());
  late final MDigitsController _mDigitsController;
  late final AppConfig _config;

  MDigitsActivity({super.key, required config}) {
    _config = Get.put(AppConfig(userConfig: config));

    /// [_mdigitsController] must be inserted after config because it sets up
    /// the stim and stim needs config
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
