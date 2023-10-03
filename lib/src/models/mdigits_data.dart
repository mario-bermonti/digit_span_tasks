import 'package:mdigits/src/models/trial_data.dart';

import 'package:flutter/material.dart';

/// Structured data collected by MDigits
/// Used to provide data nicely formatted to the user
class MDigitsData {
  final List<TrialData> trialData;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  MDigitsData(
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
