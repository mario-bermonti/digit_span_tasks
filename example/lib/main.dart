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
    return GetMaterialApp(
      title: 'DigitSpanTasks',
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final String participantID = '101';
  final String sessionID = '001';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => runDigitSpanForward(
                participantID: widget.participantID,
                sessionID: widget.sessionID,
              ),
              child: Text(
                'Digit Span Forward',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => runDigitSpanBackwards(
                participantID: widget.participantID,
                sessionID: widget.sessionID,
              ),
              child: Text(
                'Digit Span Backwards',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }

  void runDigitSpanForward({
    required String participantID,
    required String sessionID,
  }) async {
    UserConfig config = UserConfig(
      stimList: ['5678', '01567', '987654'],
      participantID: participantID,
      sessionID: sessionID,
      sessionType: SessionType.experimental,
    );
    DigitSpanTaskData data = await Get.to(() => DigitSpanForward(
          config: config,
        ));
    // ignore: avoid_print
    print('\n\n\nFORWARD data \n $data');
  }

  void runDigitSpanBackwards({
    required String participantID,
    required String sessionID,
  }) async {
    UserConfig config = UserConfig(
      stimList: ['0123', '45678', '901234'],
      participantID: participantID,
      sessionID: sessionID,
      sessionType: SessionType.practice,
    );
    DigitSpanTaskData data = await Get.to(() => DigitSpanBackwards(
          config: config,
        ));
    // ignore: avoid_print
    print('\n\n\nBAKWARDS data \n $data');
  }
}
