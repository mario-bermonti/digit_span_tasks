import 'package:get/get.dart';
import 'package:digit_span_tasks/src/components/config/user_config.dart';

/// The [AppConfig] contains settings defined by the user and the app's internal
/// settings.
class AppConfig extends GetxController {
  final UserConfig userConfig;

  /// The [isPractice] flag controls whether the practice or experimental should
  /// be presented and how to store the data.
  bool isPractice = true;

  AppConfig({required this.userConfig});
}
