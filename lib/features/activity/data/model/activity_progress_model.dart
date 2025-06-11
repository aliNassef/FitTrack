
class ActivityProgressModel {
  final DateTime date;
  final int waterIntake;
  final int footSteps;
  final String id;

  ActivityProgressModel({
    required this.date,
    required this.waterIntake,
    required this.footSteps,
    required this.id,
  });

  factory ActivityProgressModel.fromJson(Map<String, dynamic> json) {
    return ActivityProgressModel(
      date: DateTime.parse(json['date']),
      waterIntake: json['waterIntake'],
      footSteps: json['footSteps'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'waterIntake': waterIntake,
      'footSteps': footSteps,
      '_id': id,
    };
  }
}
