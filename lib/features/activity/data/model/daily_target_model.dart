
class DailyTargetModel {
  final int waterIntake;
  final int footSteps;

  DailyTargetModel({
    required this.waterIntake,
    required this.footSteps,
  });

  factory DailyTargetModel.fromJson(Map<String, dynamic> json) {
    return DailyTargetModel(
      waterIntake: json['waterIntake'],
      footSteps: json['footSteps'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'waterIntake': waterIntake,
      'footSteps': footSteps,
    };
  }
}
