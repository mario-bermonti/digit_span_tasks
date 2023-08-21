import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/common/default_appbar.dart';
import 'package:mdigits/common/centeredbox.dart';
import 'package:mdigits/activity/trial_stim/stim_controller.dart';

/// Screen to present stim to participants
class TrialStimView extends StatelessWidget {
  TrialStimView({
    Key? key,
  }) : super(key: key);

  final StimController _stimController = Get.find();

  @override
  Widget build(BuildContext context) {
    _stimController.prepareStim();
    _stimController.presentStim();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: createAppBar(context: context),
        body: CenteredBox(
          column: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Obx(() => Text(
                    _stimController.currentDigit.value,
                    style: Theme.of(context).textTheme.displayLarge,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
