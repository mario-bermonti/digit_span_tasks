import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/session_type.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:cognitive_data/cognitive_data.dart';

void main() {
  late DSConfig config;
  late DataManager manager;
  const String participantID = '101';

  setUp(() {
    Get.reset();

    /// insert config which contains [participantID] and [sessionID]
    Get.put(
      DSConfig(
        userConfig: UserConfig(
          stimList: <String>[],
          participantID: participantID,
          sessionID: '001',
          sessionType: SessionType.practice,
        ),
      ),
    );
    config = Get.find();

    manager = DataManager();
  });

  tearDown((() {
    Get.delete<DSConfig>();
  }));

  test("DataManager.collectMetadata adds Session and Device data to db.", () {
    manager.startTime = DateTime.now();

    /// endTime can only be set during the experimental phase
    manager.endTime = DateTime.now();

    manager.collectMetadata();

    expect(manager.db.session.participantID, '101');
    expect(manager.db.device.participantID, '101');
  });

  test(
    "DataManager.export returns a DigitSpanTaskData with correct data",
    () {
      manager.startTime = DateTime.now();

      /// endTime can only be set during the experimental phase
      manager.endTime = DateTime.now();
      final Trial trial = Trial(
        participantID: participantID,
        sessionID: '001',
        trialType: TrialType.practice,
        stim: '123',
        response: '321',
        startTime: DateTime.now(),
        endTime: DateTime.now(),
      );
      manager.db.addTrial(trial: trial);

      final DigitSpanTaskData actual = manager.export();

      expect(actual.trials.first.participantID, participantID);
      expect(actual.device.participantID, participantID);
      expect(actual.session.participantID, participantID);
    },
  );
}
