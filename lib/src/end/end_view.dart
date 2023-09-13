import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/common/centeredbox.dart';
import 'package:mdigits/src/common/default_appbar.dart';
import 'package:mdigits/src/common/default_text.dart';
import 'package:mdigits/src/end/end_controller.dart';

/// Screen for instructing the participant the task has ended.
/// Doesn't allow going back or restarting so the experimenter has control
/// over the session.
class EndView extends StatelessWidget {
  EndView({Key? key}) : super(key: key);
  final EndController endController = Get.put(EndController());

  @override
  Widget build(BuildContext context) {
    endController.toNextScreen();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: createAppBar(context: context),
        body: CenteredBox(
          column: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              DefaultText(
                '¡Terminamos!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
