import '/features/auth/data/model/user_session/user_session.dart';
import '/features/auth/data/repository/login_repo.dart';
import '/features/auth/data/model/login_model.dart';
import '/core/constant/api_end_point.dart';
import '/core/services/auth_services.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class LoginImplement extends LoginRepo {
  @override
  Future<Either<Failures, void>> login({
    required LoginModel loginModel,
  }) async {
    try {
      const url = "${APIEndPoint.url}${APIEndPoint.login}";
      final response = await dio.post(
        url,
        data: loginModel.toJson(),
      );
      final jsonData = response.data as Map<String, dynamic>;
      final session = UserSession.fromJson(jsonData);
      await AuthServices.storeCredentials(
        session.convertToUserCredentials(),
      );
      return right(null);
    } catch (e) {
      return left(returnDioException(e));
    }
  }
}
