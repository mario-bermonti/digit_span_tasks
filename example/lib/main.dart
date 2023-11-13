import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/digit_span_tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'DigitSpanTasks',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                UserConfig config = UserConfig(
                  stimListPractice: ['01', '234'],
                  stimListExperimental: ['5678', '01567', '987654'],
                  participantID: '000',
                );
                DigitSpanTasksData data =
                    await Get.to(() => DigitSpanTasksActivity(
                          config: config,
                        ));
                // ignore: avoid_print
                print('$data');
              },
              child: Text(
                'Digit Span Tasks',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
