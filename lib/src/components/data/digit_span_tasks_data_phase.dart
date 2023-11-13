import 'package:digit_span_tasks/src/components/data/trial_data.dart';

/// Object used to structure data collected by MDigits for a single
/// phase (practice or experimental).
/// Used to provide data nicely formatted to the user.
class DigitSpanTasksDataPhase {
  /// Data for each trial of the phase.
  final List<TrialData> trialData;

  /// Date and time at which the phase started
  final DateTime startTime;

  /// Date and time at which the phase ended
  final DateTime endTime;

  DigitSpanTasksDataPhase(
      {required this.trialData,
      required this.startTime,
      required this.endTime});

  @override
  String toString() {
    return '''
    start time: $startTime,
    end time: $endTime,
    trial data: \n ${trialData.toString()}
    ''';
  }
}
