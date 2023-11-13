import 'package:flutter/material.dart';
import 'package:digit_span_tasks/src/components/ui_components/default_text.dart';
import 'package:digit_span_tasks/src/components/errors/errors.dart';
import 'package:digit_span_tasks/src/components/ui_components/screen.dart';

/// Present error screen to participant
/// Show specific error message
class ErrorView extends StatelessWidget {
  final DigitSpanTasksExeption message;

  const ErrorView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Screen(
        children: Column(
          children: <Widget>[
            DefaultText(
              message.userMessage(),
            ),
          ],
        ),
      ),
    );
  }
}
