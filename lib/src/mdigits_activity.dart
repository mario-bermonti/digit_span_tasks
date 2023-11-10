import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/components/config/app_config.dart';
import 'package:mdigits/src/data.dart';
import 'package:mdigits/src/components/activity/activity_controller.dart';
import 'package:mdigits/src/components/activity/activity_view.dart';
import 'package:mdigits/src/components/instructions/general_instructions.dart';
import 'package:mdigits/src/components/models/mdigits_data.dart';

/// Runs all mdigits activity beginning with the practice trials and then the
/// experimental trials. It returns the data from the session when mdigits
/// finishes; includes data for practice and experimental trials.
class MDigitsActivity extends StatelessWidget {
  final Data _data = Get.put(Data());
  late final ActivityController _activityController;
  late final AppConfig _config;

  MDigitsActivity({super.key, required config}) {
    _config = Get.put(AppConfig(userConfig: config));

    /// [_activityController] must be inserted after config because it sets up
    /// the stim and stim needs config
    _activityController = Get.put(ActivityController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '''
              Recuerda los números en el orden en que los veas
              ''',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ElevatedButton(
              onPressed: () async {
                await Get.to(() => const GeneralInstructions(
                    text: 'Comenzaremos practicando'));
                await Get.to(() => ActivityView());
                _config.isPractice = false;
                await Get.to(() => const GeneralInstructions(text: '''
                          Terminamos la práctica

                          Trabajemos en los ejercicios principales
                          '''));
                await Get.to(() => ActivityView());

                /// [_config.isPractice] is set to false to reset MDigits in
                /// case the user run another session.
                _config.isPractice = true;
                MDigitsData mDigitsData = _data.export();
                Get.back(result: mDigitsData);
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
