import 'package:get/get.dart';
import 'package:mdigits/src/mdigits_controller.dart';
import 'package:mdigits/src/task_step.dart';

class RestController extends GetxController {
  /// Goes to next screen after 500ms ISI
  void toNextScreen() {
    MDigitsController mDigitsController = Get.find();
    Future.delayed(const Duration(milliseconds: 500), () {
      mDigitsController.updateStep();
    });
  }
}
