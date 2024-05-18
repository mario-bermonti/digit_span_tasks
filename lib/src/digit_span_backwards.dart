import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/ui_components/spacing.dart';
import 'package:digit_span_tasks/src/digit_span_task/digit_span_tasks_activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DigitSpanBackwards {
  /// Allows customizing the task.
  final UserConfig config;

  DigitSpanBackwards({required this.config});

  /// Main entry point to the task.
  Future<DigitSpanTaskData> run() async {
    _configTask(config);
    DigitSpanTaskData data = await Get.to(DigitSpanTasksActivity());
    Get.deleteAll();
    return data;
  }

  void _configTask(config) {
    final _config = Get.put(DSConfig(userConfig: config));
  }
}
