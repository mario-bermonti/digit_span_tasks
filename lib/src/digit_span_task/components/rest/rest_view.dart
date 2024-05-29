import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/rest/rest_controller.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/ui_components/screen.dart';

class RestView extends StatelessWidget {
  RestView({super.key});

  final RestController _restController = Get.put(RestController());
  final DSConfig _config = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Screen(
        children: Column(
          children: <Widget>[
            _config.userConfig.restInstructions,
            ElevatedButton(
              onPressed: () => _restController.toNextScreen(),
              child: Text(
                'Continuar',
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
