import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../model/progress_comparison_model.dart';
import '../model/upload_image_input_model.dart';

import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../model/last_compare_model.dart';
import '../model/progress_photo_model.dart';
import '../model/upload_image_model.dart';

abstract class ProgressRemoteDatasource {
  Future<UploadImageModel> uploadImageWithData(
      UploadImageInputModel imageModel);
  Future<List<ProgressPhotoModel>> getProgress();
  Future<LastCompareModel> getLastCompare();
  Future<String> deletePhotoFromGallrey(String id);
  Future<ProgressComparisonModel> getProgressComparison(
      {required String beforePhotoId, required String afterPhotoId});
}

class ProgressRemoteDatasourceImpl extends ProgressRemoteDatasource {
  final ApiConsumer api;

  ProgressRemoteDatasourceImpl({required this.api});

  @override
  Future<List<ProgressPhotoModel>> getProgress() async {
    final response = await api.get(EndPoints.getProgress);

    if (response.statusCode == 200) {
      return (response.data['data'] as List)
          .map((e) => ProgressPhotoModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<UploadImageModel> uploadImageWithData(
      UploadImageInputModel imageModel) async {
    final response = await api.post(
      EndPoints.uploadImageProgress,
      data: imageModel.toJson(),
      isFromData: true,
    );
    if (response.statusCode == 201) {
      return UploadImageModel.fromJson(response.data['data']);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<ProgressComparisonModel> getProgressComparison(
      {required String beforePhotoId, required String afterPhotoId}) async {
    final response = await api.post(
      EndPoints.compareProgress,
      data: {
        'beforePhotoId': beforePhotoId,
        'afterPhotoId': afterPhotoId,
      },
    );
    if (response.statusCode == 200) {
      return ProgressComparisonModel.fromJson(response.data['data']);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<LastCompareModel> getLastCompare() async {
    final response = await api.get(EndPoints.getLastCompare);
    if (response.statusCode == 200) {
      return LastCompareModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<String> deletePhotoFromGallrey(String id) async {
    final response = await api.delete(
      EndPoints.deleteImage + id,
    );
    if (response.statusCode == 200) {
      return response.data['message'] as String;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
