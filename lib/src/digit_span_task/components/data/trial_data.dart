/// Model for the data of a single trial
class TrialData {
  final String stim;
  final String response;

  TrialData({
    required this.stim,
    required this.response,
  });

  @override
  String toString() {
    return "stim: $stim, resp: $response";
  }
}
