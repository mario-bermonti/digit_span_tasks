import 'package:digit_span_tasks/src/digit_span_task/components/config/session_type.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/user_config.dart';

/// The [DSConfig] contains settings defined by the user and the app's internal
/// settings.
class DSConfig extends GetxController {
  final UserConfig userConfig;

  /// This flag is used to identify the types of trials.
  ///
  /// It is needed because the [cognitive_data] package identifies trials as
  /// either either practice or experimental.
  SessionType sessionType = SessionType.practice;

  DSConfig({required this.userConfig});
}
