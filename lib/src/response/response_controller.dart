import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/data.dart';
import 'package:mdigits/src/mdigits/mdigits_controller.dart';
import 'package:mdigits/src/stim/stim_controller.dart';
import 'package:mdigits/src/config/app_config.dart';

/// Manage responses
class ResponseController extends GetxController {
  TextEditingController textController = TextEditingController();
  final MDigitsController _mDigits = Get.find();
  final Data _data = Get.find();
  final AppConfig _config = Get.find();
  final StimController _stim = Get.find();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  /// Submit participant's response and reset the text input
  void submit() {
    String response = textController.text.trim();

    _data.addTrialData(
      participantID: _config.userConfig.participantID,
      stim: _stim.stim.currentStim,
      resp: response,
      isPractice: _config.isPractice,
    );

    textController.clear();
  }

  void toNextScreen() {
    _mDigits.endRestOrContinueTask();
  }
}
