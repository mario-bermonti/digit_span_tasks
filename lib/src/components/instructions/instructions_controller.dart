import 'package:get/get.dart';
import 'package:digit_span_tasks/src/components/activity/activity_controller.dart';
import 'package:digit_span_tasks/src/components/activity/task_step.dart';

class InstructionsController extends GetxController {
  final ActivityController _activityController = Get.find();

  /// Goes to next screen after 500ms ISI
  void toNextScreen() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _activityController.taskStep(TaskStep.stim);
    });
  }
}
