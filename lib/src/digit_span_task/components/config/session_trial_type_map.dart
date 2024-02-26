import 'package:cognitive_data/models/trial_type.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/session_type.dart';

const Map<SessionType, TrialType> sessionToTrialTypeMap = {
  SessionType.practice: TrialType.practice,
  SessionType.experimental: TrialType.experimental,
};
