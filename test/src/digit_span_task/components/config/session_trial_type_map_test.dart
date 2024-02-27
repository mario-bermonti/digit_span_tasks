import 'package:cognitive_data/models/trial_type.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/session_trial_type_map.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/session_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    "convertSessionToTrialType",
    () {
      test(
        "Given SessionType.practice, returns a valid TrialType.practice",
        () {
          /// arrange
          const SessionType sessionType = SessionType.practice;

          /// act
          final TrialType trialType = convertSessionToTrialType(sessionType);

          /// assert
          expect(trialType, TrialType.practice);
        },
      );
    },
  );
}
