abstract class FormsState {}

final class FormsInitial extends FormsState {}

final class FormsLoading extends FormsState {}

final class FormsSuccess extends FormsState {}

final class FormsFailure extends FormsState {
  String errMessage;
  FormsFailure(this.errMessage);
}
