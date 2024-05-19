import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_manager.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_view.dart';

import 'components/config/ds_config.dart';

/// Runs DigitSpanTasks activities.
/// It returns the data from the session when DigitSpanTask
/// finishes.
class SimpleSpanTask {
  SimpleSpanTask({required config}) {
    final _config = Get.put(DSConfig(userConfig: config));
  }
  Future<SimpleSpanData> run() async {
    final DataManager dataManager = Get.put(DataManager());
    await Get.to(() => ActivityView());
    final SimpleSpanData data = dataManager.export();
    await Get.deleteAll();
    return data;
  }
}
