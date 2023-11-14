/// Model for specifying the instructions to be used in the task
class InstructionsModel {
  final String introduction;
  final String practice;
  final String experimental;
  final String reminderInTask;

  InstructionsModel(
      {required this.introduction,
      required this.practice,
      required this.experimental,
      required this.reminderInTask});
}
