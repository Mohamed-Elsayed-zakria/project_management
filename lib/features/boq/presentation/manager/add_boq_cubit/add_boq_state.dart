abstract class AddBoqState {}

final class AddBoqInitial extends AddBoqState {}

final class AddBoqLoading extends AddBoqState {}

final class AddBoqSuccess extends AddBoqState {}

final class AddBoqFailure extends AddBoqState {
  final String errMessage;
  AddBoqFailure({required this.errMessage});
}
