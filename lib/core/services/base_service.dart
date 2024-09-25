import '/core/errors/failures.dart';
import 'service_locator.dart';
import 'package:dio/dio.dart';

class BaseServices {
  final dio = SetupLocator.locator<Dio>();
  ServerFailures returnDioException(Object e) {
    if (e is DioException) {
      return ServerFailures.fromDioError(dioError: e);
    }
    return ServerFailures(errMessage: 'Something went wrong');
  }
}
