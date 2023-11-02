import 'package:get/get.dart';
import 'package:mdigits/src/config/user_config.dart';
import 'package:mdigits/src/randomize.dart';

class AppConfig extends GetxController {
  final UserConfig userConfig;
  bool isPractice = true;

  AppConfig({required this.userConfig}) {
    userConfig.stimListPractice =
        randomizeDigitsInSets(userConfig.stimListPractice);
    userConfig.stimListExperimental =
        randomizeDigitsInSets(userConfig.stimListExperimental);
  }
}
