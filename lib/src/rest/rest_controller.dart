import 'package:get/get.dart';
import 'package:mdigits/src/mdigits/mdigits_controller.dart';

class RestController extends GetxController {
  /// Goes to next screen after 500ms ISI
  void toNextScreen() {
    MDigitsController mDigitsController = Get.find();
    Future.delayed(const Duration(milliseconds: 500), () {
      mDigitsController.updateStep();
    });
  }
}
