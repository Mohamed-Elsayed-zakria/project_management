abstract class OutgoingLetterState {}

final class OutgoingLetterInitial extends OutgoingLetterState {}

final class OutgoingLetterLoading extends OutgoingLetterState {}

final class OutgoingLetterSuccess extends OutgoingLetterState {}

final class OutgoingLetterFailure extends OutgoingLetterState {
  String errMessage;
  OutgoingLetterFailure(this.errMessage);
}

final class SearchTextChanged extends OutgoingLetterState {}