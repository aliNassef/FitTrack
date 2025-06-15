 
class StepModel   {
  final String id;
  final int stepNumber;
  final String instruction;

  const StepModel({
    required this.id,
    required this.stepNumber,
    required this.instruction,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      id: json['_id'] ?? '',
      stepNumber: json['stepNumber'] ?? 0,
      instruction: json['instruction'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'stepNumber': stepNumber,
      'instruction': instruction,
    };
  }

 
}