import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_controller.dart';

class RestController extends GetxController {
  final ActivityController _activityController = Get.find();

  /// Goes to next screen after 500ms ISI
  void toNextScreen() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _activityController.endRestOrContinueTask();
    });
  }
}
