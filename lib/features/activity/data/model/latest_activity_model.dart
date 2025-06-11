
class LatestActivityModel {
  final String activityType;
  final String description;
  final DateTime timestamp;
  final String id;

  LatestActivityModel({
    required this.activityType,
    required this.description,
    required this.timestamp,
    required this.id,
  });

  factory LatestActivityModel.fromJson(Map<String, dynamic> json) {
    return LatestActivityModel(
      activityType: json['activityType'],
      description: json['description'],
      timestamp: DateTime.parse(json['timestamp']),
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activityType': activityType,
      'description': description,
      'timestamp': timestamp.toIso8601String(),
      '_id': id,
    };
  }
}