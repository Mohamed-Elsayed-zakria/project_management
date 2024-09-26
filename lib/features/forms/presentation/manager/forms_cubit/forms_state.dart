abstract class FormsState {}

final class FormsInitial extends FormsState {}

final class FormsLoading extends FormsState {}

final class FormsSuccess extends FormsState {}

final class FormsFailure extends FormsState {
  String errMessage;
  FormsFailure(this.errMessage);
}

final class AddFormLoading extends FormsState {}

final class AddFormSuccess extends FormsState {}

final class AddFormFailure extends FormsState {
  String errMessage;
  AddFormFailure(this.errMessage);
}
