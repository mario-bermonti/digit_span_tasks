import 'package:mdigits/src/models/mdigits_data_phase.dart';

/// Structured data collected by MDigits
/// Used to provide data nicely formatted to the user
class MDigitsData {
  MDigitsDataPhase practiceData;
  MDigitsDataPhase experimentalData;

  MDigitsData({required this.practiceData, required this.experimentalData});

  @override
  String toString() {
    return '''
    practice data: ${practiceData.toString()}
    \n
    experimental data: ${experimentalData.toString()}
    ''';
  }
}
