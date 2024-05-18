import 'package:digit_span_tasks/src/digit_span_task/components/data/digit_span_task_data.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_manager.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_view.dart';

/// Runs DigitSpanTasks activities.
/// It returns the data from the session when DigitSpanTask
/// finishes.
class DigitSpanTasksActivity {
  Future<DigitSpanTaskData> run() async {
    final DataManager _dataManager = Get.put(DataManager());
    await Get.to(() => ActivityView());

    DigitSpanTaskData data = _dataManager.export();
    return data;
  }
}
