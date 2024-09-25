import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LettersRepo extends BaseServices {
  Future<Either<Failures, String>> pickLetterFile();
}
