import 'package:digit_span_tasks/src/digit_span_task/components/config/session_type.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/user_config.dart';

/// The [DSConfig] contains settings defined by the user and the app's internal
/// settings.
class DSConfig extends GetxController {
  final UserConfig userConfig;

  /// Controls whether the practice or experimental should be presented and
  /// how to manage the data.
  SessionType sessionType = SessionType.practice;

  DSConfig({required this.userConfig});
}
