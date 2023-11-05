import 'package:mdigits/src/models/trial_data.dart';

/// Object used to structure data collected by MDigits for a single
/// phase (practice or experimental). It was designed to be used internally
/// by mdigits.
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
