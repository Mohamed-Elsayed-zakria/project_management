abstract class LettersState {}

final class LettersInitial extends LettersState {}

final class LetterLoading extends LettersState {}

final class LetterSuccess extends LettersState {}

final class LetterFailure extends LettersState {
  String errMessage;
  LetterFailure(this.errMessage);
}
