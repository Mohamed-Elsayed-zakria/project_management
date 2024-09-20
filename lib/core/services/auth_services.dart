import '/core/models/user_credentials.dart';
import '/core/constant/api_end_point.dart';
import '/core/constant/hive_keywords.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';
import 'service_locator.dart';

abstract class AuthServices extends BaseServices {
  static Future<void> logout() async {
    await removeCurrentUser();
  }

  static void storeCredentials(UserCredentials credentials) {
    final box = Hive.box<UserCredentials>(HiveKeywords.kCreds);
    box.put(HiveKeywords.kCurrentUser, credentials);
  }

  static Future<void> removeCurrentUser() async {
    final box = Hive.box<UserCredentials>(HiveKeywords.kCreds);
    await box.delete(HiveKeywords.kCurrentUser);
  }

  static UserCredentials? readCredentials() {
    final box = Hive.box<UserCredentials>(HiveKeywords.kCreds);
    UserCredentials? credentials = box.get(HiveKeywords.kCurrentUser);
    return credentials;
  }

  static String? currentUserId() {
    return readCredentials()?.id;
  }

  static Future<Either<Failures, UserCredentials>> refreshToken() async {
    UserCredentials? credentials = readCredentials();
    final dio = SetupLocator.locator<Dio>();
    try {
      if (credentials != null) {
        String url =
            "${APIEndPoint.url}${APIEndPoint.refreshToken}/${credentials.id}";
        final response = await dio.put(url);
        final jsonData = response.data as Map<String, dynamic>;
        if (response.statusCode == 200) {
          credentials.token = jsonData['token'];
          storeCredentials(credentials);
          return right(credentials);
        }
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }
}
