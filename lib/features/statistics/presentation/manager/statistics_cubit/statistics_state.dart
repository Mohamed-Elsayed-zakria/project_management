abstract class StatisticsState {}

final class StatisticsInitial extends StatisticsState {}

final class StatisticsLoading extends StatisticsState {}

final class StatisticsSuccess extends StatisticsState {}

final class StatisticsFailure extends StatisticsState {
  final String errMessage;
  StatisticsFailure({required this.errMessage});
}
