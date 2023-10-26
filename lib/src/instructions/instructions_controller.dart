import 'package:get/get.dart';
import 'package:mdigits/src/mdigits/mdigits_controller.dart';

class InstructionsController extends GetxController {
  final MDigitsController _mDigitsController = Get.find();

  /// Goes to next screen after 500ms ISI
  void toNextScreen() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _mDigitsController.updateStep();
    });
  }
}
