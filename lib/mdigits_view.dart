import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/mdigits.dart';

class MDigitsView extends StatefulWidget {
  const MDigitsView({super.key});

  @override
  State<MDigitsView> createState() => _MDigitsViewState();
}

class _MDigitsViewState extends State<MDigitsView> {
  final MDigits mDigits = Get.put(MDigits());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await mDigits.setup();
                mDigits.run();
              },
              child: Text(
                'mDigits',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
