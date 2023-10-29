import 'package:mdigits/src/models/trial_data.dart';

/// Structured data collected by MDigits
/// Used to provide data nicely formatted to the user
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
