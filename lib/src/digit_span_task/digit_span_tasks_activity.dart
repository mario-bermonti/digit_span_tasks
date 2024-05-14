import 'package:digit_span_tasks/src/digit_span_task/components/config/session_type.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/digit_span_task_data.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/instructions/instructions_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_manager.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_controller.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_view.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/ui_components/default_appbar.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/ui_components/screen.dart';

/// Runs DigitSpanTasks activities.
/// It returns the data from the session when DigitSpanTask
/// finishes.
class DigitSpanTasksActivity extends StatelessWidget {
  final InstructionsModel _instructions = Get.find();
  final DataManager _data = Get.put(DataManager());
  late final ActivityController _activityController;
  late final DSConfig _config;

  DigitSpanTasksActivity({super.key}) {
    _config = Get.find();
    _activityController = Get.put(ActivityController());
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: createAppBar(context: context),
      children: Column(
        children: <Widget>[
          _instructions.introduction,
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () async {
              await Get.to(() => ActivityView());

              DigitSpanTaskData digitSpanTasksData = _data.export();
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
