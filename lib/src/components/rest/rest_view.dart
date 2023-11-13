import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/src/components/rest/rest_controller.dart';
import 'package:digit_span_tasks/src/components/ui_components/screen.dart';

class RestView extends StatelessWidget {
  RestView({super.key});

  final RestController _restController = Get.put(RestController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Screen(
        children: Column(
          children: <Widget>[
            Text(
              'Toma un descanso',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 15),
            Text(
              'Respira profundo antes de continuar',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 25),
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
    );
  }
}
