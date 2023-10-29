import 'package:mdigits/src/models/trial_data.dart';

/// Structured data collected by MDigits
/// Used to provide data nicely formatted to the user
class MDigitsDataPhase {
  final List<TrialData> trialData;
  final DateTime startTime;
  final DateTime endTime;

  MDigitsDataPhase(
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
