abstract class NewProjectState {}

final class NewProjectInitial extends NewProjectState {}

final class NewProjectLoading extends NewProjectState {}

final class NewProjectSuccess extends NewProjectState {}

final class NewProjectFailure extends NewProjectState {
  String errMessage;
  NewProjectFailure(this.errMessage);
}
