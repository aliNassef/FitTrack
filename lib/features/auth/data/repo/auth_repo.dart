import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../model/login_model.dart';
import '../model/signup_model.dart';

import '../model/signup_input_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login(String email, String password);
  Future<Either<Failure, SignupModel>> signup(SignupInputModel input);
  Either<Failure, bool> checkAuthState();
}
