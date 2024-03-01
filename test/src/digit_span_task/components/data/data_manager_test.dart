import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/session_type.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  late DSConfig config;
  late DataManager manager;

  setUp(() {
    /// insert config which contains [participantID] and [sessionID]
    Get.put(
      DSConfig(
        userConfig: UserConfig(
          stimListPractice: <String>[],
          stimListExperimental: <String>[],
          participantID: '101',
          sessionID: '001',
        ),
      ),
    );
    config = Get.find();

    manager = DataManager();
  });

  test(
    "DataManager.collectMetadata adds Session and Device data to db.",
    () {
      manager.startTime = DateTime.now();

      /// endTime can only be set during the experimental phase
      config.sessionType = SessionType.experimental;
      manager.endTime = DateTime.now();

      manager.collectMetadata();

      expect(manager.db.session.participantID, '101');
      expect(manager.db.device.participantID, '101');
    },
  );
}
