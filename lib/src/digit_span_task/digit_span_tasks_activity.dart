import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_controller.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/digit_span_task_data.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_manager.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_view.dart';

import 'components/config/ds_config.dart';

/// Runs DigitSpanTasks activities.
/// It returns the data from the session when DigitSpanTask
/// finishes.
class DigitSpanTasksActivity {
  DigitSpanTasksActivity({required config}) {
    final _config = Get.put(DSConfig(userConfig: config));
  }
  Future<void> run() async {
    // final ActivityController _activityController =
    //     Get.put(ActivityController());
    // final DataManager _dataManager = Get.put(DataManager());
    await Get.to(() => ActivityView());
    // DigitSpanTaskData data = _dataManager.export();
    // return data;
  }

  dynamic _config() {
    final ActivityController _activityController =
        Get.put(ActivityController());
    final DataManager _dataManager = Get.put(DataManager());
    return _dataManager;
  }
}
