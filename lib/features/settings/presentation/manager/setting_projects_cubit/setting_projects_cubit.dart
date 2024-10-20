import 'package:flutter_bloc/flutter_bloc.dart';
import 'setting_projects_state.dart';

class SettingProjectsCubit extends Cubit<SettingProjectsState> {
  SettingProjectsCubit() : super(SettingProjectsInitial());
}
