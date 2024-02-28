import 'package:cognitive_data/cognitive_data.dart';

class DigitSpanTaskData {
  /// Data of all the trials
  late final List<Trial> trials;

  /// Metadata about the session
  late final Session session;

  /// Metadata about the device on which the data was collected
  late final Device device;

  DigitSpanTaskData({
    required this.trials,
    required this.session,
    required this.device,
  });
}
