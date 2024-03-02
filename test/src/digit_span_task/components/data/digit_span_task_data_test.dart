import 'package:cognitive_data/cognitive_data.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/digit_span_task_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "DigitSpanTaskData.toString returns correct representation",
    () {
      TestWidgetsFlutterBinding.ensureInitialized();

      /// arrange
      /// session
      final Session session = Session(
          participantID: '101',
          sessionID: '001',
          startTime: DateTime.now(),
          endTime: DateTime.now());

      /// device
      final Device device = Device(participantID: '101', sessionID: '001');

      /// list trial
      final List<Trial> trials = <Trial>[
        Trial(
            participantID: '101',
            sessionID: '001',
            trialType: TrialType.practice,
            stim: '456',
            response: '123'),
        Trial(
            participantID: '102',
            sessionID: '002',
            trialType: TrialType.practice,
            stim: '789',
            response: '987'),
      ];

      /// DigitSpanTaskData
      DigitSpanTaskData data = DigitSpanTaskData(
        session: session,
        device: device,
        trials: trials,
      );

      /// expected
      final expectedRepr = 'Session data:'
          '\n${session.toString()}'
          '\nDevice data:'
          '\n${device.toString()}'
          '\nTrials data:'
          '\n${trials.toString()}';

      /// act
      /// tostring
      final String actualRepr = data.toString();

      /// assert
      expect(actualRepr, expectedRepr);
    },
  );
}
