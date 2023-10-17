import 'package:get/get.dart';
import 'package:mdigits/mdigits.dart';
import 'package:mdigits/src/mdigits/mdigits_controller.dart';
import 'package:mdigits/src/errors/errors.dart';
import 'package:stimuli/errors.dart';
import 'package:stimuli/stimuli.dart';

/// Manage the stim
class StimController extends GetxController {
  late final Stimuli stim;
  RxString currentDigit = ''.obs;
  final Config config = Get.find();
  late MDigitsController mDigitsController;

  @override
  onInit() async {
    await prepareStimPool();
    super.onInit();
    mDigitsController = Get.find();
  }

  /// Prepare stim to be used
  /// Includes building from file, create object, and randomize stim
  Future<void> prepareStimPool() async {
    try {
      Stimuli stimuli = Stimuli(stimuli: config.stimList);
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
    await presentISI();
    await presentIndividualStim(stim.currentStim);
    toNextScreen();
  }

  void toNextScreen() {
    mDigitsController.updateStep();
  }

  /// Present individual digits to participant
  Future<void> presentIndividualStim(String stimSet) async {
    if (stimSet.isEmpty) {
      currentDigit('');
      return;
    } else {
      currentDigit(stimSet[0]);
      stimSet = stimSet.substring(1);
      await presentISI();
      await presentIndividualStim(stimSet);
    }
  }

  /// Present 1s ISI
  Future<void> presentISI() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
