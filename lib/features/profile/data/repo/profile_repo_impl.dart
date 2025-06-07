import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../datasource/profile_remote_datasource.dart';
import '../model/profile_model.dart';
import 'profile_repo.dart';

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
