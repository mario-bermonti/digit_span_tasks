import 'package:mdigits/src/models/trial_data.dart';
import 'package:mdigits/src/randomize.dart';
class Settings {
  /// List of stim to present to the user
  late final List<String> stimList;
  final String participantID;
  final void Function(List<TrialData> data)? processData;

  Settings({required stimList, required this.participantID, this.processData}) {
    stimList = randomizeDigitsInSets(stimList);
  }
}
