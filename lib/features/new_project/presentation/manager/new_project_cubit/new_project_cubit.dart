import '/features/new_project/data/repository/new_project_repo.dart';
import '/features/new_project/data/models/new_project_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/utils/my_date_util.dart';
import 'package:flutter/material.dart';
import '/core/utils/pick_file.dart';
import '/core/errors/failures.dart';
import '/core/constant/colors.dart';
import 'package:dartz/dartz.dart';
import 'new_project_state.dart';

class NewProjectCubit extends Cubit<NewProjectState> {
  final NewProjectRepo _newProjectRepo;
  NewProjectCubit(this._newProjectRepo) : super(NewProjectInitial());

  //================================================================
  final TextEditingController projectName = TextEditingController();
  final TextEditingController projectNumber = TextEditingController();
  final TextEditingController projectPrice = TextEditingController();
  final TextEditingController projectDurationPerDay = TextEditingController();
  final TextEditingController projectManager = TextEditingController();
  final TextEditingController projectOwner = TextEditingController();
  final TextEditingController projectArea = TextEditingController();
  final TextEditingController projectCity = TextEditingController();
  DateTime? projectDatePo;
  DateTime? projectReceiptDate;
  String? projectFilePo;
  //================================================================
  final GlobalKey<FormState> formKey = GlobalKey();

  bool projectDatePoValidator = true;
  bool projectReceiptDateValidator = true;
  bool projectPickFilePoValidator = true;

  final DateTime dateNow = MyDateUtil.currentDateTimeFromDevice();
  final DateTime firstDate = MyDateUtil.currentDateTimeFromDevice()
      .subtract(const Duration(days: 365 * 20));
  final DateTime lastDate = MyDateUtil.currentDateTimeFromDevice()
      .add(const Duration(days: 365 * 20));

  void validatorProjectDateField() {
    if (projectFilePo == null) {
      projectPickFilePoValidator = false;
      emit(NewProjectInitial());
    } else {
      projectPickFilePoValidator = true;
      emit(NewProjectInitial());
    }
  }

  void validatorProjectReceiptDateField() {
    if (projectReceiptDate == null) {
      projectReceiptDateValidator = false;
      emit(NewProjectInitial());
    } else {
      projectReceiptDateValidator = true;
      emit(NewProjectInitial());
    }
  }

  void validatorTakePoFileField() {
    if (projectDatePo == null) {
      projectDatePoValidator = false;
      emit(NewProjectInitial());
    } else {
      projectDatePoValidator = true;
      emit(NewProjectInitial());
    }
  }

  Future<void> projectReceiptDatePicker({
    required BuildContext context,
  }) async {
    projectReceiptDate = await showDatePicker(
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
    Either<Failures, String> result = await PickFile.pick();
    result.fold(
      (failure) => emit(NewProjectFailure(failure.errMessage)),
      (result) {
        projectFilePo = result;
        emit(NewProjectInitial());
      },
    );
  }

  Future<void> createNewProject({
    required NewProjectModel projectBasicData,
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
