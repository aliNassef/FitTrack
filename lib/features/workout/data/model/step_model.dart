class StepModel {
  final int stepNumber;
  final String title;
  final String instruction;
  final int caloriesBurned;
  final String id;

  StepModel({
    required this.stepNumber,
    required this.title,
    required this.instruction,
    required this.caloriesBurned,
    required this.id,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      stepNumber: json['stepNumber'],
      title: json['title'],
      instruction: json['instruction'],
      caloriesBurned: json['caloriesBurned'],
      id: json['_id'],
    );
  }
}
