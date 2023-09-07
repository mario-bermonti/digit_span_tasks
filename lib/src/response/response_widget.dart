import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mdigits/src/response/response_controller.dart';
import 'package:mdigits/src/common/centeredbox.dart';
import 'package:mdigits/src/common/default_text.dart';
import 'package:mdigits/src/common/spacing_holder.dart';
import 'package:mdigits/src/common/styles.dart';

class ResponseWidget extends StatelessWidget {
  const ResponseWidget({
    Key? key,
    required ResponseController responseController,
  })  : _responseController = responseController,
        super(key: key);

  final ResponseController _responseController;

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
            controller: _responseController.textController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: textFieldStyle,
            onSubmitted: (_) => submitResponse(),
            autofocus: true,
          ),
          const BetweenWidgetsSpace(),
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
    );
  }

  void submitResponse() {
    _responseController.submit();
    _responseController.toNextScreen();
  }
}
