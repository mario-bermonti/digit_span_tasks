import 'package:get/get.dart';
import 'package:mdigits/mdigits.dart';

class RestController extends GetxController {
  MDigits mDigits = Get.find();

  /// Goes to next screen after 500ms ISI
  void toNextScreen() {
    Future.delayed(const Duration(milliseconds: 500), () {
      mDigits.run();
    });
  }
}
