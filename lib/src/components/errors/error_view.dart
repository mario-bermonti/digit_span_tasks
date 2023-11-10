import 'package:flutter/material.dart';
import 'package:mdigits/src/components/ui_components/centeredbox.dart';
import 'package:mdigits/src/components/ui_components/default_appbar.dart';
import 'package:mdigits/src/components/ui_components/default_text.dart';
import 'package:mdigits/src/components/errors/errors.dart';

/// Present error screen to participant
/// Show specific error message
class ErrorView extends StatelessWidget {
  final MDigitsExeption message;

  const ErrorView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              DefaultText(
                message.userMessage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
