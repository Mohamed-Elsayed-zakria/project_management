import 'package:flutter_bloc/flutter_bloc.dart';
import 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  bool projectSettingIsActive = false;
  bool companySettingIsActive = false;

  void changeProjectSettingIsActive() {
    projectSettingIsActive = true;
    companySettingIsActive = false;
    emit(SettingInitial());
  }

  void changeCompanySettingIsActive() {
    companySettingIsActive = true;
    projectSettingIsActive = false;
    emit(SettingInitial());
  }
}
