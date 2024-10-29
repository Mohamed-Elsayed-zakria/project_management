import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'statistics_repo.dart';

class StatisticsImplement extends StatisticsRepo {
  @override
  Future<Either<Failures, void>> getStatistics() {
    throw UnimplementedError();
  }
}
