import 'actvity_data_model.dart';

class ActivityTrackerModel {
  final String status;
  final ActivityDataModel data;

  ActivityTrackerModel({
    required this.status,
    required this.data,
  });

  factory ActivityTrackerModel.fromJson(Map<String, dynamic> json) {
    return ActivityTrackerModel(
      status: json['status'],
      data: ActivityDataModel.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}
