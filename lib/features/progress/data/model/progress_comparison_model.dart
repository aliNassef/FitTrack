
import 'package:fit_track_app/features/progress/data/model/progress_photo_model.dart';

class ProgressComparisonModel {
  final ProgressPhotoModel beforePhoto;
  final ProgressPhotoModel afterPhoto;
  final int progressPercentage;
  final int weightDifference;
  final int dateDifference;

  ProgressComparisonModel({
    required this.beforePhoto,
    required this.afterPhoto,
    required this.progressPercentage,
    required this.weightDifference,
    required this.dateDifference,
  });

  factory ProgressComparisonModel.fromJson(Map<String, dynamic> json) {
    return ProgressComparisonModel(
      beforePhoto: ProgressPhotoModel.fromJson(json['beforePhoto']),
      afterPhoto: ProgressPhotoModel.fromJson(json['afterPhoto']),
      progressPercentage: json['progressPercentage'],
      weightDifference: json['weightDifference'],
      dateDifference: json['dateDifference'],
    );
  }
}