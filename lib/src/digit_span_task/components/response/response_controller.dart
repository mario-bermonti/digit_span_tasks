import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_manager.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/activity/activity_controller.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/stim/stim_controller.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';

/// Manage responses
class ResponseController extends GetxController {
  TextEditingController textController = TextEditingController();
  final ActivityController _activityController = Get.find();
  final DataManager _data = Get.find();
  final DSConfig _config = Get.find();
  final StimController _stim = Get.find();
  late DateTime startTime;
  late DateTime endTime;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  /// Submit participant's response and reset the text input
  void submit() {
    String response = textController.text.trim();

    _data.addTrial(
      stim: _stim.stim.currentStim,
      resp: response,
      startTime: startTime,
      endTime: endTime,
    );

    textController.clear();
  }

  void toNextScreen() {
    _activityController.endRestOrContinueTask();
  }
}
