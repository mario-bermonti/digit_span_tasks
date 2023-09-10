import 'package:get/get.dart';

class InstructionsController extends GetxController {
  /// Goes to next screen after 500ms ISI
  void toNextScreen() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.back();
    });
  }
}
