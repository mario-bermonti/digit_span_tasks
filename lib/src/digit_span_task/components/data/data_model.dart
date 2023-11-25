import 'package:digit_span_tasks/src/digit_span_task/components/data/session_model.dart';
import 'package:digit_span_tasks/src/digit_span_task/components/data/trial_data.dart';

/// Object used to structure data collected by DigitSpanTask for a single
/// phase (practice or experimental). It was designed to be used internally
/// by DigitSpanTask.
class DataModel {
  final List<TrialData> trialData = <TrialData>[];
  final SessionModel sessionData = SessionModel();

  @override
  String toString() {
    return '''
    start time: $sessionData.startTime,
    end time: $sessionData.endTime,
    trial data: \n ${trialData.toString()}
    ''';
  }
}
