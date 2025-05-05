class StepModel {
  final int stepNumber;
  final String title;
  final String description;
  final bool isActive;

  StepModel({
    required this.stepNumber,
    required this.title,
    required this.description,
    this.isActive = true,
  });
}
