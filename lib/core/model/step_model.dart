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

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      stepNumber: json['stepNumber'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stepNumber': stepNumber,
      'title': title,
      'description': description,
      'isActive': isActive,
    };
  }
}
