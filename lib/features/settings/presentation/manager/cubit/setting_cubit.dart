import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  final TextEditingController valueAddedTax = TextEditingController(
    text: '15.0',
  );

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
