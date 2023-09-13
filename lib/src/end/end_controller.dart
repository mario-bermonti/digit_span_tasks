import 'package:get/get.dart';

class EndController extends GetxController {
  final Duration waitTime = const Duration(seconds: 2);

  Future<void> toNextScreen() async {
    await Future.delayed(
      waitTime,
      () => Get.back(),
    );
  }
}
