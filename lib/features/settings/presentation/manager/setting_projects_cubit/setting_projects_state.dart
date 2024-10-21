abstract class SettingProjectsState {}

final class SettingProjectsInitial extends SettingProjectsState {}

class SettingProjectsLoading extends SettingProjectsState {}

class SettingProjectsSuccess extends SettingProjectsState {}

class SettingProjectsFailure extends SettingProjectsState {
  final String failure;

  SettingProjectsFailure(this.failure);
}

class UpdateSettingProjectsLoading extends SettingProjectsState {}

class UpdateSettingProjectsSuccess extends SettingProjectsState {}

class UpdateSettingProjectsFailure extends SettingProjectsState {
  final String message;

  UpdateSettingProjectsFailure(this.message);
}
