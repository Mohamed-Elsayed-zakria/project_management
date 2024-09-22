import '/features/show_projects/data/models/boq_data/boq_data.dart';

abstract class BoqState {}

final class BoqInitial extends BoqState {}

final class BoqLoading extends BoqState {}

final class BoqSuccess extends BoqState {
  final List<BoqData> result;

  BoqSuccess(this.result);
}

final class BoqFailure extends BoqState {
  final String errMessage;
  BoqFailure({required this.errMessage});
}

final class AddBoqLoading extends BoqState {}

final class AddBoqSuccess extends BoqState {}

final class AddBoqFailure extends BoqState {
  final String errMessage;
  AddBoqFailure({required this.errMessage});
}
