import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/mdigits/mdigits_view_experimental.dart';
import 'package:mdigits/src/mdigits/mdigits_view_practice.dart';
import 'package:mdigits/src/models/settings.dart';

/// Present the appropriate screen based on the curren step
class MDigitsView extends StatelessWidget {
  final Config config;

  const MDigitsView({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                print('practice');
                await Get.to(
                  () => MDigitsViewPractice(
                    config: config,
                  ),
                );
                print('exp');
                await Get.to(
                  () => MDigitsViewExperimental(
                    config: config,
                  ),
                );
              },
              child: Text(
                'General instructions',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
