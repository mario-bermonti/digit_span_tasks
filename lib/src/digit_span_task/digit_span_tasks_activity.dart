import 'package:digit_span_tasks/src/digit_span_task/components/instructions/instructions_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/app_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_manager.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_controller.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_view.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/digit_span_tasks_data.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/ui_components/default_appbar.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/ui_components/screen.dart';
import 'package:digit_span_tasks/src/digit_span_task/instructions_experimental.dart';
import 'package:digit_span_tasks/src/digit_span_task/instructions_practice.dart';

/// Runs all DigitSpanTask activity beginning with the practice trials and then the
/// experimental trials. It returns the data from the session when DigitSpanTask
/// finishes; includes data for practice and experimental trials.
class DigitSpanTasksActivity extends StatelessWidget {
  final InstructionsModel _instructions = Get.find();
  final DataManager _data = Get.put(DataManager());
  late final ActivityController _activityController;
  late final AppConfig _config;

  DigitSpanTasksActivity({super.key, required config}) {
    _config = Get.put(AppConfig(userConfig: config));

    /// [_activityController] must be inserted after config because it sets up
    /// the stim and stim needs config
    _activityController = Get.put(ActivityController());
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: createAppBar(context: context),
      children: Column(
        children: <Widget>[
          Text(
            _instructions.introduction,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () async {
              await Get.to(() => InstructionsPractice());
              await Get.to(() => ActivityView());
              _config.isPractice = false;
              await Get.to(() => InstructionsExperimental());
              await Get.to(() => ActivityView());

              /// [_config.isPractice] is set to false to reset DigitSpanTask in
              /// case the user run another session.
              _config.isPractice = true;
              DigitSpanTasksData digitSpanTasksData = _data.export();
              Get.back(result: digitSpanTasksData);
            },
            child: Text(
              'Comenzar',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
