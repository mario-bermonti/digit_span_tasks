import 'package:get/get.dart';
import 'package:mdigits/src/mdigits_controller.dart';

class InstructionsController extends GetxController {
  MDigitsController mDigits = Get.find();

  /// Goes to next screen after 500ms ISI
  void toNextScreen() {
    Future.delayed(const Duration(milliseconds: 500), () {
      mDigits.run();
    });
  }
}
