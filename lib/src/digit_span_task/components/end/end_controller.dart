import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_controller.dart';

class EndController extends GetxController {
  /// Time in seconds before ending the session
  final Duration _waitTime = const Duration(seconds: 2);
  final ActivityController _activityController = Get.find();

  /// Ends the session after [_waitTime] and returns to DigitSpanTask caller
  void toNextScreen() {
    Future.delayed(
      _waitTime,
      () => _activityController.endSession(),
    );
  }
}
