import 'package:digit_span_tasks/src/digit_span_task/components/data/session_model.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/trial_data.dart';

/// Object used to structure data collected by DigitSpanTask for a single
/// phase (practice or experimental). It was designed to be used internally
/// by DigitSpanTask.
class DataModel {
  /// data about all the trials for the current session
  final List<TrialData> trialData = <TrialData>[];

  /// data about the current session
  final SessionModel sessionData = SessionModel();

  @override
  String toString() {
    return 'session data: ${sessionData.toString()} \n trial data: \n ${trialData.toString()}';
  }
}
