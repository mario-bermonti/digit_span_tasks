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

/// Converts a [SessionType] to the corresponding [TrialType].
///
/// Given a [SessionType], this function looks up the corresponding
/// [TrialType] using the [sessionToTrialTypeMap]. If a match is found,
/// it returns the associated [TrialType]. If no match is found, a
/// [DSTSessionTypeConversionException] is thrown.
TrialType convertSessionToTrialType(SessionType sessionType) {
  final TrialType? trialType = sessionToTrialTypeMap[sessionType];
  if (trialType == null) {
    throw DSTSessionTypeConversionException();
  }
  return trialType;
}
