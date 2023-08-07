import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/mdigits.dart';

/// Manage responses
class TrialResponseController extends GetxController {
  TextEditingController textController = TextEditingController();
  final MDigits _mDigits = Get.find();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void submit() {
    // spaces are meaningless as in paper and pencil measures
    String response = textController.text.trim();

    textController.clear();
    // _mDigits.addTrialData(result: response);
  }

  void toNextScreen() {
    _mDigits.run();
  }
}
