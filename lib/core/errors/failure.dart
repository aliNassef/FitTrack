
import '../utils/app_strings.dart';

class Failure {
  final String errMessage;
  Failure({required this.errMessage});
}

class NetworkFailure extends Failure {
  NetworkFailure() : super(errMessage: AppStrings.noInternetConnection);
}
