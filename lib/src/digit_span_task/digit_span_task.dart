import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_manager.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_view.dart';

import 'components/activity/activity_controller.dart';
import 'components/config/ds_config.dart';

/// Entry point for running a digit span task.
/// It returns the data from the session when it finishes.
class DigitSpanTask {
  DigitSpanTask({required config}) {
    final _config = Get.put(DSConfig(userConfig: config));
  }

  /// Run a digit span task and return the data collected during the session.
  Future<DigitSpanTaskData> run() async {
    final DataManager dataManager = Get.put(DataManager());
    final ActivityController mDigits = Get.put(ActivityController());
    await Get.to(() => ActivityView());
    final DigitSpanTaskData data = dataManager.export();
    await Get.deleteAll();
    return data;
  }
}
