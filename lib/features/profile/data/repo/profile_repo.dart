import 'package:dartz/dartz.dart';
import 'package:fit_track_app/features/profile/data/model/profile_model.dart';

import '../../../../core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> getProfile();
}
