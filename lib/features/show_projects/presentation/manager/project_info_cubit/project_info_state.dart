abstract class ProjectInfoState {}

final class ProjectInfoInitial extends ProjectInfoState {}

final class ChangeDurationPerDayLoading extends ProjectInfoState {}

final class ChangeDurationPerDaySuccess extends ProjectInfoState {}

final class ChangeDurationPerDayFailure extends ProjectInfoState {
  final String errMessage;
  ChangeDurationPerDayFailure({required this.errMessage});
}
