import 'package:get/get.dart';
import 'package:mdigits/src/mdigits/mdigits_controller.dart';

class EndController extends GetxController {
  final Duration waitTime = const Duration(seconds: 2);

  Future<void> toNextScreen() async {
    MDigitsController mDigitsController = Get.find();
    await Future.delayed(
      waitTime,
      () => mDigitsController.endSession(),
    );
  }
}
