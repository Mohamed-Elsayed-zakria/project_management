import '/features/settings/data/repository/project_settings_repo.dart';
import '/features/settings/data/models/add_project_settings.dart';
import '/features/settings/data/models/project_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'setting_projects_state.dart';

class SettingProjectsCubit extends Cubit<SettingProjectsState> {
  final ProjectSettingsRepo _projectSettings;
  SettingProjectsCubit(this._projectSettings) : super(SettingProjectsInitial());

  TextEditingController valueAddedTax = TextEditingController();

  ProjectSettings projectSettings = ProjectSettings();

  // List of days in English and Arabic
  final Map<String, String> daysOfWeek = {
    'Friday': 'الجمعة',
    'Saturday': 'السبت',
    'Sunday': 'الأحد',
    'Monday': 'الإثنين',
    'Tuesday': 'الثلاثاء',
    'Wednesday': 'الأربعاء',
    'Thursday': 'الخميس',
  };

  // List to control the selection status for each day (by default all are unselected)
  Map<String, bool> selectedDays = {
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
  };

  Future<void> getProjectSettings() async {
    emit(SettingProjectsLoading());
    final result = await _projectSettings.getProjectSettings();
    result.fold(
      (failure) => emit(SettingProjectsFailure(failure.errMessage)),
      (success) {
        projectSettings = success;
        emit(SettingProjectsSuccess());
      },
    );
  }

  Future<void> updateProjectSettings({
    required AddProjectSettings projectSettingsData,
  }) async {
    emit(UpdateSettingProjectsLoading());
    final result = await _projectSettings.updateProjectSettings(
      projectSettings: projectSettingsData,
    );
    result.fold(
      (failure) => emit(UpdateSettingProjectsFailure(failure.errMessage)),
      (success) {
        projectSettings = success;
        emit(UpdateSettingProjectsSuccess());
      },
    );
  }
}
