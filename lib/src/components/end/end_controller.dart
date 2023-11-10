import 'package:get/get.dart';
import 'package:mdigits/src/components/mdigits/mdigits_controller.dart';

class EndController extends GetxController {
  /// Time in seconds before ending the session
  final Duration _waitTime = const Duration(seconds: 2);
  final MDigitsController _mDigitsController = Get.find();

  /// Ends the session after [_waitTime] and returns to MDigits caller
  void toNextScreen() {
    Future.delayed(
      _waitTime,
      () => _mDigitsController.endSession(),
    );
  }
}
