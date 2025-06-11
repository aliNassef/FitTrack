
import 'activity_progress_model.dart';
import 'daily_target_model.dart';
import 'latest_activity_model.dart';

class ActivityDataModel {
  final DailyTargetModel dailyTarget;
  final String id;
  final String user;
  final List<ActivityProgressModel> activityProgress;
  final List<LatestActivityModel> latestActivities;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ActivityDataModel({
    required this.dailyTarget,
    required this.id,
    required this.user,
    required this.activityProgress,
    required this.latestActivities,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ActivityDataModel.fromJson(Map<String, dynamic> json) {
    return ActivityDataModel(
      dailyTarget: DailyTargetModel.fromJson(json['dailyTarget']),
      id: json['_id'],
      user: json['user'],
      activityProgress: List<ActivityProgressModel>.from(
        json['activityProgress'].map((x) => ActivityProgressModel.fromJson(x)),
      ),
      latestActivities: List<LatestActivityModel>.from(
        json['latestActivities'].map((x) => LatestActivityModel.fromJson(x)),
      ),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dailyTarget': dailyTarget.toJson(),
      '_id': id,
      'user': user,
      'activityProgress': List<dynamic>.from(activityProgress.map((x) => x.toJson())),
      'latestActivities': List<dynamic>.from(latestActivities.map((x) => x.toJson())),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
