abstract class FetchBoqState {}

final class FetchBoqInitial extends FetchBoqState {}

final class FetchBoqLoading extends FetchBoqState {}

final class FetchBoqSuccess extends FetchBoqState {}

final class FetchBoqFailure extends FetchBoqState {
  final String errMessage;
  FetchBoqFailure({required this.errMessage});
}
