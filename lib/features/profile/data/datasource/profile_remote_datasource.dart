import 'package:fit_track_app/core/api/api_consumer.dart';
import 'package:fit_track_app/core/api/end_ponits.dart';
import 'package:fit_track_app/core/errors/error_model.dart';
import 'package:fit_track_app/core/errors/exceptions.dart';
import 'package:fit_track_app/features/profile/data/model/profile_model.dart';

abstract class ProfileRemoteDatasource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final ApiConsumer api;

  ProfileRemoteDatasourceImpl({required this.api});
  @override
  Future<ProfileModel> getProfile() async {
    final response = await api.get(EndPoints.getUserProfile);
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(response.data);
    } else {
      throw ServerException(
        ErrorModel.fromJson(response.data),
      );
    }
  }
}
