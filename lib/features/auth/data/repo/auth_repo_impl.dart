import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../model/login_model.dart';
import '../model/signup_input_model.dart';
import '../model/signup_model.dart';
import 'auth_repo.dart';

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

  @override
  Either<Failure, bool> checkAuthState() {
    try {
      final result = authLocalDatasource.getToken();
      return Right(result != null);
    } on CustomException catch (e) {
      return Left(Failure(errMessage: e.errorMessage));
    }
  }
}
