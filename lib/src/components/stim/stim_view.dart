import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/components/stim/stim_controller.dart';
import 'package:mdigits/src/components/ui_components/screen.dart';

/// Screen to present stim to participants
class StimView extends StatelessWidget {
  StimView({
    Key? key,
  }) : super(key: key);

  final StimController _stimController = Get.find();

  @override
  Widget build(BuildContext context) {
    _stimController.prepareNextStim();
    _stimController.presentStim();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Screen(
        children: Column(
          children: <Widget>[
            Obx(() => Text(
                  _stimController.currentDigit.value,
                  style: Theme.of(context).textTheme.displayLarge,
                )),
          ],
        ),
      ),
    );
  }
}
