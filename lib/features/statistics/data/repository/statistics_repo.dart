import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class StatisticsRepo extends BaseServices {
  Future<Either<Failures, void>> getStatistics();
}
