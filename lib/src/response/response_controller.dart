import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/mdigits/mdigits_controller.dart';

/// Manage responses
class ResponseController extends GetxController {
  TextEditingController textController = TextEditingController();
  final MDigitsController _mDigits = Get.find();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  /// Submit participant's response and reset the text input
  void submit() {
    String response = textController.text.trim();
    _mDigits.addTrialData(resp: response);
    textController.clear();
  }

  void toNextScreen() {
    MDigitsController mDigitsController = Get.find();
    mDigitsController.updateStep();
  }
}
