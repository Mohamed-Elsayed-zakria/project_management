abstract class ProjectInfoState {}

final class UpdateProjectInitial extends ProjectInfoState {}

final class UpdateProjectLoading extends ProjectInfoState {}

final class UpdateProjectSuccess extends ProjectInfoState {}

final class UpdateProjectFailure extends ProjectInfoState {
  final String errMessage;
  UpdateProjectFailure({required this.errMessage});
}

final class DeleteProjectLoading extends ProjectInfoState {}

final class DeleteProjectSuccess extends ProjectInfoState {}

final class DeleteProjectFailure extends ProjectInfoState {
  final String errMessage;
  DeleteProjectFailure({required this.errMessage});
}
