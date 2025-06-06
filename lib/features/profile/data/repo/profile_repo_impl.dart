import 'package:dartz/dartz.dart';
import 'package:fit_track_app/core/errors/exceptions.dart';
import 'package:fit_track_app/core/errors/failure.dart';
import 'package:fit_track_app/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:fit_track_app/features/profile/data/model/profile_model.dart';
import 'package:fit_track_app/features/profile/data/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDatasource _profileRemoteDatasource;

  ProfileRepoImpl({required ProfileRemoteDatasource profileRemoteDatasource})
      : _profileRemoteDatasource = profileRemoteDatasource;
  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      final result = await _profileRemoteDatasource.getProfile();
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
