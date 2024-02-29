import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/ds_config.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/session_type.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/data_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  test(
    "DataManager.collectMetadata adds Session and Device data to db.",
    () {
      final DataManager manager = DataManager();

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
