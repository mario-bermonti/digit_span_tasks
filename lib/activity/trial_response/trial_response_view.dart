import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/activity/trial_response/response_widget.dart';
import 'package:mdigits/common/default_appbar.dart';
import 'package:mdigits/activity/trial_response/trial_response_controller.dart';

/// Screen for collecting response from participant
class TrialResponseView extends StatelessWidget {
  final TrialResponseController _trialResponseController =
      Get.put(TrialResponseController());

  TrialResponseView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: createAppBar(context: context),
        body: ResponseWidget(trialResponseController: _trialResponseController),
      ),
    );
  }
}
