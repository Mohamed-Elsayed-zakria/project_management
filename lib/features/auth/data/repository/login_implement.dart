import '/features/auth/data/repository/login_repo.dart';
import '/features/auth/data/model/login_model.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class LoginImplement extends LoginRepo {
  @override
  Future<Either<Failures, void>> login({
    required LoginModel loginModel,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(null);
    } catch (e) {
      return left(LocalFailures.errorMessage());
    }
  }
}
