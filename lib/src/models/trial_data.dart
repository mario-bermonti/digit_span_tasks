class TrialData {
  final String participantID;
  final String stim;
  final String response;

  TrialData({
    required this.participantID,
    required this.stim,
    required this.response,
  });

  @override
  String toString() {
    return "Participant $participantID, stim: $stim, resp: $response";
  }
}
