import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_controller.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/digit_span_task_data.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_manager.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_view.dart';

import 'components/config/ds_config.dart';

/// Runs DigitSpanTasks activities.
/// It returns the data from the session when DigitSpanTask
/// finishes.
class SimpleSpanTask {
  SimpleSpanTask({required config}) {
    final _config = Get.put(DSConfig(userConfig: config));
  }
  Future<void> run() async {
    await Get.to(() => ActivityView());
  }
}
