import 'package:get/get.dart';
import 'package:mdigits/src/config/user_config.dart';

class AppConfig extends GetxController {
  final UserConfig userConfig;
  bool isPractice = true;

  AppConfig({required this.userConfig});
}
