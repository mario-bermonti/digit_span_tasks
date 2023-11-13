import 'package:digit_span_tasks/src/components/data/digit_span_tasks_data_phase.dart';

/// Structured data collected by DigitSpanTask.
/// Used to provide data nicely formatted to the user.
class DigitSpanTasksData {
  /// Data collected during the practice phase.
  DigitSpanTasksDataPhase practiceData;

  /// Data collected during the experimental phase.
  DigitSpanTasksDataPhase experimentalData;

  DigitSpanTasksData(
      {required this.practiceData, required this.experimentalData});

  @override
  String toString() {
    return '''
    practice data: ${practiceData.toString()}
    \n
    experimental data: ${experimentalData.toString()}
    ''';
  }
}
