import 'package:dartz/dartz.dart';
import 'package:fit_track_app/core/errors/failure.dart';
import 'package:fit_track_app/features/auth/data/model/login_model.dart';
import 'package:fit_track_app/features/auth/data/model/signup_input_model.dart';
import 'package:fit_track_app/features/auth/data/model/signup_model.dart';
import 'package:fit_track_app/features/auth/data/repo/auth_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../datasource/auth_local_datasource.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDatasource authRemoteDatasource;
  final AuthLocalDatasource authLocalDatasource;
  AuthRepoImpl({
    required this.authRemoteDatasource,
    required this.authLocalDatasource,
  });

  @override
  Future<Either<Failure, LoginModel>> login(
      String email, String password) async {
    try {
      final result = await authRemoteDatasource.login(email, password);
      await authLocalDatasource.saveToken(result.data.accessToken);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, SignupModel>> signup(SignupInputModel input) async {
    try {
      final result = await authRemoteDatasource.signup(input);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
