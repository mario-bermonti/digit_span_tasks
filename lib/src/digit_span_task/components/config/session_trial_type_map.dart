import 'package:cognitive_data/models/trial_type.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/config/session_type.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/exceptions/sessiontype_conversion_exception.dart';

/// Maps from a [SessionType] to the corresponding [TrialType].
/// This mapping is essential because creating a [Trial] object requires a
/// [TrialType], and this conversion provides a straightforward way to obtain
/// the required [TrialType] based on the given [SessionType].
const Map<SessionType, TrialType> sessionToTrialTypeMap = {
  SessionType.practice: TrialType.practice,
  SessionType.experimental: TrialType.experimental,
};

TrialType convertSessionToTrialType(SessionType sessionType) {
  final TrialType? trialType = sessionToTrialTypeMap[sessionType];
  if (trialType == null) {
    throw DSTSessionTypeConversionException();
  }
  return trialType;
}
