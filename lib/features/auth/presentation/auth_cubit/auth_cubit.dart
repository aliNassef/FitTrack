import 'package:bloc/bloc.dart';
import '../../data/repo/auth_repo.dart';

import '../../data/model/signup_input_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  void login(String email, String password) async {
    emit(LoginLoading());
    final userOrfailure = await authRepo.login(email, password);
    userOrfailure.fold(
      (failure) => emit(LoginFailure(errMessage: failure.errMessage)),
      (loginModel) => emit(
        LoginSuccess(),
      ),
    );
  }

  void signup(SignupInputModel input) async {
    emit(SignupLoading());
    final userOrfailure = await authRepo.signup(input);
    userOrfailure.fold(
      (failure) => emit(SignupFailure(errMessage: failure.errMessage)),
      (signupModel) => emit(
        SignupSuccess(),
      ),
    );
  }

  void checkAuthState() async {
    emit(AuthLoading());
    final tokenOrfailure = authRepo.checkAuthState();
    tokenOrfailure.fold(
      (failure) => emit(UnAuthenticated()),
      (isAuthenticated) => emit(
        isAuthenticated ? Authenticated() : UnAuthenticated(),
      ),
    );
  }
}
