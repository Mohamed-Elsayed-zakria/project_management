import '/features/auth/data/model/login_model.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo extends BaseServices {
  Future<Either<Failures, void>> login({
    required LoginModel loginModel,
  });
}
