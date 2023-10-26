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
  final Config _config = Get.find();
  late MDigitsController _mDigitsController;

  @override
  onInit() async {
    await _prepareStimPool();
    super.onInit();
    _mDigitsController = Get.find();
  }

  /// Prepare stim to be used
  /// Includes building from file, create object, and randomize stim
  Future<void> _prepareStimPool() async {
    try {
      Stimuli stimuli = Stimuli(stimuli: _config.stimList);
      stim = stimuli;
    } on StimFileAccessException catch (e) {
      throw GenericmdigitsException(e.toString());
    }
  }

  void prepareNextStim() {
    stim.next();
  }

  /// Present the stim once to the participant and go back after 1s ISI
  Future<void> presentStim() async {
    await _presentISI();
    await _presentIndividualStim(stim.currentStim);
    toNextScreen();
  }

  void toNextScreen() {
    _mDigitsController.updateStep();
  }

  /// Present individual digits to participant
  Future<void> _presentIndividualStim(String stimSet) async {
    if (stimSet.isEmpty) {
      currentDigit('');
      return;
    } else {
      currentDigit(stimSet[0]);
      stimSet = stimSet.substring(1);
      await _presentISI();
      await _presentIndividualStim(stimSet);
    }
  }

  /// Present 1s ISI
  Future<void> _presentISI() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
