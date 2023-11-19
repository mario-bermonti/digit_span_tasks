import 'package:digit_span_tasks/src/digit_span_task/components/data/trial_data.dart';

/// Object used to structure data collected by DigitSpanTask for a single
/// phase (practice or experimental). It was designed to be used internally
/// by DigitSpanTask.
class DataModel {
  final List<TrialData> trialData = <TrialData>[];
  late final DateTime startTime;
  late final DateTime endTime;

  @override
  String toString() {
    return '''
    start time: $startTime,
    end time: $endTime,
    trial data: \n ${trialData.toString()}
    ''';
  }
}
