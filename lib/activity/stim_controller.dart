import 'package:get/get.dart';
import 'package:mdigits/mdigits.dart';
import 'package:mdigits/errors/errors.dart';
import 'package:stimuli/errors.dart';
import 'package:stimuli/stimuli.dart';

/// Manage the stim
class StimController extends GetxController {
  late Stimuli stim;
  // final AudioController _audioController = AudioController();
  final List<String> stimList;
  String currentDigit = '';

  StimController({required this.stimList});

  @override
  void onInit() async {
    // await prepareStim();
    super.onInit();
  }

  /// Prepare stim to be used
  /// Includes building from file, create object, and randomize stim
  Future<void> prepareStimPool() async {
    try {
      // Stimuli stimuli = await createStimFromFile(path);
      Stimuli stimuli = Stimuli(stimuli: stimList);
      stimuli.randomize();
      stim = stimuli;
    } on StimFileAccessException catch (e) {
      throw GenericmdigitsException(e.toString());
    }
  }

  void prepareStim() {
    stim.next();
  }

  /// Present the stim once to the participant and go back after 1s ISI
  Future<void> presentStim() async {
    // TODO check if there is enough time before first stim digit
    presentIndividualStim(stim.currentStim);
    MDigits mdigits = Get.find();
    mdigits.run();
    //  /
    // Future.delayed(
    //   const Duration(seconds: 1),
    //   () => mdigits.run(),
    // );
  }

  /// Present individual digits to participant
  /// Includes and 1s ISI
  Future<void> presentIndividualStim(String stimSet) async {
    if (stimSet.isEmpty) {
      return;
    }

    currentDigit = stimSet[0];
    stimSet = stimSet.substring(1);

    await Future.delayed(
      const Duration(seconds: 1),
      () => presentIndividualStim(stimSet),
    );
  }
}
