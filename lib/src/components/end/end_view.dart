import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/components/ui_components/centeredbox.dart';
import 'package:mdigits/src/components/ui_components/default_appbar.dart';
import 'package:mdigits/src/components/ui_components/default_text.dart';
import 'package:mdigits/src/components/end/end_controller.dart';
import 'package:mdigits/src/components/ui_components/screen.dart';

/// Screen for instructing the participant the task has ended.
/// Doesn't allow going back or restarting so the experimenter has control
/// over the session.
class EndView extends StatelessWidget {
  EndView({Key? key}) : super(key: key);
  final EndController _endController = Get.put(EndController());

  @override
  Widget build(BuildContext context) {
    _endController.toNextScreen();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Screen(
        appBar: createAppBar(context: context),
        children: CenteredBox(
          column: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              DefaultText(
                '¡Terminamos esta fase!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
