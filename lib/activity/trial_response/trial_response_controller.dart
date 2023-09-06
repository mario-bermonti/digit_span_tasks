import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/mdigits_controller.dart';

/// Manage responses
class TrialResponseController extends GetxController {
  TextEditingController textController = TextEditingController();
  final MDigitsController _mDigits = Get.find();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void submit() {
    String response = textController.text.trim();
    _mDigits.addTrialData(resp: response);
    textController.clear();
  }

  void toNextScreen() {
    _mDigits.run();
  }
}
