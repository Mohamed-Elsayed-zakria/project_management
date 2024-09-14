import '/features/auth/data/model/login_model.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failures, void>> login({
    required LoginModel loginModel,
  });
}
