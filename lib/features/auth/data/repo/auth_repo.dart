import 'package:dartz/dartz.dart';
import 'package:fit_track_app/core/errors/failure.dart';
import 'package:fit_track_app/features/auth/data/model/login_model.dart';
import 'package:fit_track_app/features/auth/data/model/signup_model.dart';

import '../model/signup_input_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login(String email, String password);
  Future<Either<Failure, SignupModel>> signup(SignupInputModel input);
  Either<Failure, bool> checkAuthState();
}
