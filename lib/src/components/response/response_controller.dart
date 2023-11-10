import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/components/data/data_manager.dart';
import 'package:mdigits/src/components/activity/activity_controller.dart';
import 'package:mdigits/src/components/stim/stim_controller.dart';
import 'package:mdigits/src/components/config/app_config.dart';

/// Manage responses
class ResponseController extends GetxController {
  TextEditingController textController = TextEditingController();
  final ActivityController _activityController = Get.find();
  final DataManager _data = Get.find();
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
    _activityController.endRestOrContinueTask();
  }
}
