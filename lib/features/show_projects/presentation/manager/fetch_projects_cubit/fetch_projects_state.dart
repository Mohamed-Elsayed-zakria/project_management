abstract class FetchProjectsState {}

final class FetchProjectsInitial extends FetchProjectsState {}

final class FetchProjectsLoading extends FetchProjectsState {}

final class FetchProjectsSuccess extends FetchProjectsState {}

final class FetchProjectsFailure extends FetchProjectsState {
  String errMessage;
  FetchProjectsFailure(this.errMessage);
}
