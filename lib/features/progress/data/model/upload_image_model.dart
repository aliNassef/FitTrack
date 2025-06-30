import 'progress_comparison_model.dart';
import 'progress_photo_model.dart';

class UploadImageModel {
  final ProgressComparisonModel comparison;
  final String id;
  final String userId;
  final List<ProgressPhotoModel> photos;
  final String createdAt;
  final String updatedAt;
  final int v;

  UploadImageModel({
    required this.comparison,
    required this.id,
    required this.userId,
    required this.photos,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UploadImageModel.fromJson(Map<String, dynamic> json) {
    return UploadImageModel(
      comparison: ProgressComparisonModel.fromJson(json['comparison']),
      id: json['_id'],
      userId: json['userId'],
      photos: (json['gallery'] as List)
          .map((photo) => ProgressPhotoModel.fromJson(photo))
          .toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
