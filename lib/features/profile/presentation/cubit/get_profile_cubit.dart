import 'package:bloc/bloc.dart';
import 'package:fit_track_app/features/profile/data/model/profile_model.dart';
import 'package:meta/meta.dart';

import '../../data/repo/profile_repo.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit(this.profileRepo) : super(GetProfileInitial());
  final ProfileRepo profileRepo;

  Future<void> getProfile() async {
    emit(GetProfileLoading());
    final profileOrfailure = await profileRepo.getProfile();
    profileOrfailure.fold(
      (failure) => emit(GetProfileFailure(errorMessage: failure.errMessage)),
      (profile) => emit(GetProfileLoaded(
        user: profile.data,
      )),
    );
  }
}
