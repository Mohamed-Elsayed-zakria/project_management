import '/features/statistics/data/repository/statistics_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  final StatisticsRepo _statisticsRepo;
  StatisticsCubit(this._statisticsRepo) : super(StatisticsInitial());

  Future<void> getStatistics() async {
    emit(StatisticsLoading());
    Either<Failures, void> result = await _statisticsRepo.getStatistics();
    result.fold(
      (failures) => emit(StatisticsFailure(errMessage: failures.errMessage)),
      (result) {
        emit(StatisticsSuccess());
      },
    );
  }
}
