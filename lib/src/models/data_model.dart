import 'package:mdigits/src/models/trial_data.dart';

import 'package:flutter/material.dart';

/// Structured data collected by MDigits
/// Used to provide data nicely formatted to the user
class DataModel {
  final List<TrialData> trialData = <TrialData>[];
  late final TimeOfDay startTime;
  late final TimeOfDay endTime;

  @override
  String toString() {
    return '''
    start time: $startTime,
    end time: $endTime,
    trial data: \n ${trialData.toString()}
    ''';
  }
}
