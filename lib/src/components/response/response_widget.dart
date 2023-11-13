import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mdigits/src/components/response/response_controller.dart';
import 'package:mdigits/src/components/ui_components/default_text.dart';
import 'package:mdigits/src/components/ui_components/styles.dart';

class ResponseWidget extends StatelessWidget {
  const ResponseWidget({
    Key? key,
    required ResponseController responseController,
  })  : _responseController = responseController,
        super(key: key);

  final ResponseController _responseController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 300),
      child: Column(
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
    );
  }

  void submitResponse() {
    _responseController.submit();
    _responseController.toNextScreen();
  }
}
