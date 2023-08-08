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

  /// Present the stim once to the participant and go back after 1s ISI
  Future<void> presentStim() async {
    stim.next();
    MDigits mdigits = Get.find();
    //  /
    Future.delayed(
      const Duration(seconds: 1),
      () => mdigits.run(),
    );
  }
}
