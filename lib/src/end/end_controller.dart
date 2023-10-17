import 'package:get/get.dart';
import 'package:mdigits/src/mdigits/mdigits_controller.dart';

class EndController extends GetxController {
  final Duration waitTime = const Duration(seconds: 2);
  MDigitsController mDigitsController = Get.find();

  /// Ends the session after 2s and returns to MDigits caller
  void toNextScreen() {
    Future.delayed(
      waitTime,
      () => mDigitsController.endSession(),
    );
  }
}
