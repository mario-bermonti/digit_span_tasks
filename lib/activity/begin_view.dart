import 'package:flutter/material.dart';
import 'package:mdigits/common/centeredbox.dart';
import 'package:mdigits/common/default_appbar.dart';
import 'package:mdigits/common/default_text.dart';
import 'package:mdigits/common/spacing_holder.dart';

/// Screen that allows participants to indicate when to start task.
class BeginView extends StatelessWidget {
  const BeginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: createAppBar(context: context, showActionButtons: true),
        body: CenteredBox(
          column: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const DefaultText(
                'Comencemos',
              ),
              const BetweenWidgetsSpace(),
              ElevatedButton(
                onPressed: () {
                  // Get.put(MDigits());
                },
                child: const DefaultText('Seguir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
