// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/digit_span_tasks.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

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

  // Simulate participant info
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
    // Setup variables for task
    SimpleSpanTask task;
    SimpleSpanData data;

    // Define config for practice session
    UserConfig practiceConfig = UserConfig(
      stimList: ['12'],
      participantID: participantID,
      sessionID: sessionID,
      sessionType: SessionType.practice,
    );
    // Setup task
    task = SimpleSpanTask(config: practiceConfig);
    await Get.to(StartPage());
    // Run task
    data = await task.run();
    print(data);

    // Define config for experimental session
    UserConfig experimentalConfig = UserConfig(
      stimList: ['5678', '98765'],
      participantID: participantID,
      sessionID: sessionID,
      sessionType: SessionType.experimental,
    );
    task = SimpleSpanTask(config: experimentalConfig);
    await Get.to(StartPage());
    data = await task.run();
    print(data);
  }

  void runDigitSpanBackwards({
    required String participantID,
    required String sessionID,
  }) async {
    UserConfig config = UserConfig(
      stimList: ['901234'],
      participantID: participantID,
      sessionID: sessionID,
      sessionType: SessionType.experimental,
    );
    final task = SimpleSpanTask(config: config);
    await Get.to(StartPage());
    final SimpleSpanData data = await task.run();
    print(data);
  }
}

/// Ask participants if they are ready
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () async {
                Get.back();
              },
              child: Text(
                'Comenzar',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
