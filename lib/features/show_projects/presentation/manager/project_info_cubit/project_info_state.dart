abstract class ProjectInfoState {}

final class UpdateProjectInitial extends ProjectInfoState {}

final class UpdateProjectLoading extends ProjectInfoState {}

final class UpdateProjectSuccess extends ProjectInfoState {}

final class UpdateProjectFailure extends ProjectInfoState {
  final String errMessage;
  UpdateProjectFailure({required this.errMessage});
}
