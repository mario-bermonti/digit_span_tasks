import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mdigits/common/centeredbox.dart';
import 'package:mdigits/common/default_appbar.dart';
import 'package:mdigits/common/default_text.dart';
import 'package:mdigits/common/spacing_holder.dart';
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

class ResponseWidget extends StatelessWidget {
  const ResponseWidget({
    Key? key,
    required TrialResponseController trialResponseController,
  })  : _trialResponseController = trialResponseController,
        super(key: key);

  final TrialResponseController _trialResponseController;

  @override
  Widget build(BuildContext context) {
    return CenteredBox(
      column: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const DefaultText(
            '¿Números?',
          ),
          const BetweenWidgetsSpace(),
          TextField(
            controller: _trialResponseController.textController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const BetweenWidgetsSpace(),
          ElevatedButton(
            onPressed: () {
              _trialResponseController.submit();
              _trialResponseController.toNextScreen();
            },
            child: Text(
              'Seguir',
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ],
      ),
    );
  }
}
