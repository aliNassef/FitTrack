import 'package:dartz/dartz.dart';
import '../model/profile_model.dart';

import '../../../../core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> getProfile();
}
