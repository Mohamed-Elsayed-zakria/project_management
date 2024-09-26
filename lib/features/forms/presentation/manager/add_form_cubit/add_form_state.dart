abstract class AddFormState {}

final class AddFormInitial extends AddFormState {}

final class AddFormLoading extends AddFormState {}

final class AddFormSuccess extends AddFormState {}

final class AddFormFailure extends AddFormState {
  String errMessage;
  AddFormFailure(this.errMessage);
}
