import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';

abstract class AuthLocalDatasource {
  Future<void> saveToken(String token);
  String? getToken();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferences sharedPreferences;

  AuthLocalDatasourceImpl({required this.sharedPreferences});
  @override
  Future<void> saveToken(String token) async {
    try {
      await sharedPreferences.setString('token', token);
    } catch (e) {
      throw CustomException(errorMessage: 'Failed to save token');
    }
  }

  @override
  String? getToken() {
    try {
      return sharedPreferences.getString('token');
    } catch (e) {
      throw CustomException(errorMessage: 'Failed to get token');
    }
  }
}
