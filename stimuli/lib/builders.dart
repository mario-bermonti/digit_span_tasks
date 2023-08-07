/// Functions that help build a Stimuli object from a file listing the stimuli

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:stimuli/errors.dart';
import 'package:stimuli/stim.dart';

/// Build [Stimuli] from a text file specified by
/// the path filePath.
Future<Stimuli> createStimFromFile(String filePath) async {
  String file = await rootBundle.loadString(filePath);
  // File file = File(filePath);
  // await validateStimFileExists(file, filePath);
  // List<String> stimList = await file.readAsLines();
  print(file);
  Stimuli stim = Stimuli(stimuli: ['1', '2']);

  return stim;
}

Future<void> validateStimFileExists(File file, String filePath) async {
  if (await file.exists() == false) {
    throw StimFileAccessException();
  }
}
