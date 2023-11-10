import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/components/ui_components/centeredbox.dart';
import 'package:mdigits/src/components/ui_components/default_text.dart';
import 'package:mdigits/src/components/ui_components/spacing_holder.dart';
import 'package:mdigits/src/components/rest/rest_controller.dart';

class RestView extends StatelessWidget {
  RestView({super.key});

  final RestController _restController = Get.put(RestController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: CenteredBox(
          column: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const DefaultText(
                '''
                Toma un descanso

                Respira profundo antes de continuar
                ''',
              ),
              const BetweenWidgetsSpace(),
              ElevatedButton(
                onPressed: () => _restController.toNextScreen(),
                child: Text(
                  'Comenzar',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}