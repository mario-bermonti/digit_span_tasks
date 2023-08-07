/// Provides an audio player manager

import 'dart:io';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mdigits/errors/errors.dart';
import 'package:mdigits/errors/error_view.dart';

/// Manager for the audio player
/// Is is used to present the stim to participants
class AudioController extends GetxController {
  final AudioPlayer _audioplayer = AudioPlayer();

  /// Play audio from [path]
  Future<void> playAudio(String path) async {
    await _audioplayer.play(DeviceFileSource(path));
  }

  /// Validate the audio file specified in [path] exists
  Future<void> validateAudioStimFile(String path) async {
    File file = File(path);
    if (await file.exists() == false) {
      Get.to(
        () => ErrorView(
          message: GenericmdigitsException('Error playing the audio stim file'),
        ),
      );
    }
  }
}
