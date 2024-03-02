class DSTSessionTypeConversionException implements Exception {
  String message =
      "There is no map from SessionType to TrialType for the value provided";

  @override
  String toString() {
    return message;
  }
}
