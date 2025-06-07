import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';

import '../model/login_model.dart';
import '../model/signup_input_model.dart';
import '../model/signup_model.dart';

abstract class AuthRemoteDatasource {
  Future<LoginModel> login(String email, String password);
  Future<SignupModel> signup(SignupInputModel input);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiConsumer apiConsumer;

  AuthRemoteDatasourceImpl({required this.apiConsumer});

  @override
  Future<LoginModel> login(String email, String password) async {
    final response = await apiConsumer.post(
      EndPoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return LoginModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<SignupModel> signup(SignupInputModel input) async {
    final response = await apiConsumer.post(
      EndPoints.register,
      data: input.toJson(),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return SignupModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
