import 'package:fit_track_app/core/api/api_consumer.dart';
import 'package:fit_track_app/core/api/end_ponits.dart';
import 'package:fit_track_app/features/progress/data/model/gallrey_model.dart';

import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';

abstract class ProgressRemoteDatasource {
  Future<void> uploadImageWithData();
  Future<ProgressModel> getProgress();
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
  Future<void> uploadImageWithData() {
    // TODO: implement uploadImageWithData
    throw UnimplementedError();
  }
}
