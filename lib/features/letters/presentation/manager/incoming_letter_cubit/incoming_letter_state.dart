abstract class IncomingLetterState {}

final class IncomingLetterInitial extends IncomingLetterState {}

final class IncomingLetterLoading extends IncomingLetterState {}

final class IncomingLetterSuccess extends IncomingLetterState {}

final class IncomingLetterFailure extends IncomingLetterState {
  String errMessage;
  IncomingLetterFailure(this.errMessage);
}
