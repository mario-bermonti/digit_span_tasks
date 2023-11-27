import 'package:digit_span_tasks/src/digit_span_task/components/data/data_model.dart';

/// Structured data collected by DigitSpanTask.
/// Used to provide data nicely formatted to the user.
class DigitSpanTasksData {
  /// Data collected during the practice phase.
  DataModel practiceData;

  /// Data collected during the experimental phase.
  DataModel experimentalData;

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
