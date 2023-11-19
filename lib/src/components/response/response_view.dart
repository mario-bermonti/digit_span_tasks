import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/components/response/response_controller.dart';
import 'package:digit_span_tasks/src/components/ui_components/default_text.dart';
import 'package:digit_span_tasks/src/components/ui_components/screen.dart';
import 'package:digit_span_tasks/src/components/ui_components/styles.dart';

/// Screen for collecting response from participant
class ResponseView extends StatelessWidget {
  final ResponseController _responseController = Get.put(ResponseController());

  ResponseView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Screen(
        children: Column(
          children: <Widget>[
            const DefaultText(
              '¿Números?',
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _responseController.textController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: textFieldStyle,
              onSubmitted: (_) => submitResponse(),
              autofocus: true,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                submitResponse();
              },
              child: Text(
                'Seguir',
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submitResponse() {
    _responseController.submit();
    _responseController.toNextScreen();
  }
}
