import '/features/new_project/data/models/new_project_basic_data_model.dart';
import '/features/new_project/data/repository/new_project_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/utils/my_date_util.dart';
import 'package:flutter/material.dart';
import '/core/errors/failures.dart';
import '/core/constant/colors.dart';
import 'package:dartz/dartz.dart';
import 'new_project_state.dart';

class NewProjectCubit extends Cubit<NewProjectState> {
  final NewProjectRepo _newProjectRepo;
  NewProjectCubit(this._newProjectRepo) : super(NewProjectInitial());

  final TextEditingController projectName = TextEditingController();
  final TextEditingController projectNumber = TextEditingController();
  final TextEditingController projectPrice = TextEditingController();
  final TextEditingController projectDurationPerDay = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  bool projectDatePoValidator = true;
  bool projectPickFilePoValidator = true;
  bool projectPickFileBoqValidator = true;

  DateTime? projectDatePo;
  final DateTime dateNow = MyDateUtil.currentDateTimeFromDevice();
  final DateTime firstDate = MyDateUtil.currentDateTimeFromDevice()
      .subtract(const Duration(days: 365 * 20));
  final DateTime lastDate = MyDateUtil.currentDateTimeFromDevice()
      .add(const Duration(days: 365 * 20));

  void validatorAgeField() {
    if (projectDatePo == null) {
      projectDatePoValidator = false;
      emit(NewProjectInitial());
    } else {
      projectDatePoValidator = true;
      emit(NewProjectInitial());
    }
  }

  Future<void> customShowDatePicker({
    required BuildContext context,
  }) async {
    projectDatePo = await showDatePicker(
      context: context,
      initialDate: dateNow,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.kPrimaryColor,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    emit(NewProjectInitial());
  }

  Future<void> pickFilePo() async {
    emit(NewProjectLoading());
    Either<Failures, void> result = await _newProjectRepo.pickFilePo();
    result.fold(
      (failure) => emit(NewProjectFailure(failure.errMessage)),
      (result) => emit(NewProjectSuccess()),
    );
  }

  Future<void> pickFileBoq() async {
    emit(NewProjectLoading());
    Either<Failures, void> result = await _newProjectRepo.pickFileBoq();
    result.fold(
      (failure) => emit(NewProjectFailure(failure.errMessage)),
      (result) => emit(NewProjectSuccess()),
    );
  }

  Future<void> createNewProject({
    required NewProjectBasicDataModel projectBasicData,
  }) async {
    emit(NewProjectLoading());
    Either<Failures, void> result = await _newProjectRepo.createNewProject(
      projectBasicData: projectBasicData,
    );
    result.fold(
      (failure) => emit(NewProjectFailure(failure.errMessage)),
      (result) => emit(NewProjectSuccess()),
    );
  }
}
