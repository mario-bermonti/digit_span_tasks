import 'package:cognitive_data/cognitive_data.dart';

/// Structured data collected for a single session.
/// Includes data about the [trials] (practice and experimental),
/// and metadata about the [session] and [device] used to collect the data.
class SimpleSpanData {
  /// Data for all trials
  final List<Trial> trials;

  /// Metadata about the session
  final Session session;

  /// Metadata about the device on which the data was collected
  final Device device;

  SimpleSpanData({
    required this.trials,
    required this.session,
    required this.device,
  });

  @override
  String toString() {
    final representation = 'Session data:'
        '\n${session.toString()}'
        '\nDevice data:'
        '\n${device.toString()}'
        '\nTrials data:'
        '\n${trials.toString()}';
    return representation;
  }
}
