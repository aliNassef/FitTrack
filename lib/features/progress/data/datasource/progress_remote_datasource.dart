import 'package:fit_track_app/core/api/api_consumer.dart';
import 'package:fit_track_app/core/api/end_ponits.dart';
import 'package:fit_track_app/features/progress/data/model/gallrey_model.dart';
import 'package:fit_track_app/features/progress/data/model/progress_comparison_model.dart';

import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../model/last_compare_model.dart';

abstract class ProgressRemoteDatasource {
  Future<void> uploadImageWithData();
  Future<ProgressModel> getProgress();
  Future<LastCompareModel> getLastCompare();
  Future<ProgressComparisonModel> getProgressComparison(
      {required String beforePhotoId, required String afterPhotoId});
}

class ProgressRemoteDatasourceImpl extends ProgressRemoteDatasource {
  final ApiConsumer api;

  ProgressRemoteDatasourceImpl({required this.api});

  @override
  Future<ProgressModel> getProgress() async {
    final response = await api.get(EndPoints.getProgress);

    if (response.statusCode == 200) {
      return ProgressModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<void> uploadImageWithData() async {
    final response = await api.post(EndPoints.uploadImageProgress);
    if (response.statusCode == 200) {
      return;
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
      return ProgressComparisonModel.fromJson(response.data);
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
}
