import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/show_projects/data/repository/project_info_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '/core/utils/my_date_util.dart';
import 'package:flutter/material.dart';
import '/core/errors/failures.dart';
import '/core/constant/colors.dart';
import 'package:dartz/dartz.dart';
import 'project_info_state.dart';

class ProjectInfoCubit extends Cubit<ProjectInfoState> {
  final ProjectInfoRepo _projectInfoRepo;
  ProjectInfoCubit(this._projectInfoRepo) : super(UpdateProjectInitial());

  DateTime? projectReceiptDate;
  DateTime? projectDatePo;

  final TextEditingController editeProjectName = TextEditingController();
  final TextEditingController editeProjectNumber = TextEditingController();
  final TextEditingController editeProjectPrice = TextEditingController();
  final TextEditingController editeProjectManager = TextEditingController();
  final TextEditingController editeProjectOwner = TextEditingController();
  final TextEditingController editeProjectArea = TextEditingController();
  final TextEditingController editeProjectCity = TextEditingController();
  final TextEditingController editeProjectValueAddedTax =
      TextEditingController();
  final TextEditingController editeDurationPerDay = TextEditingController();
  //=============================================================

  final GlobalKey<FormState> formKeyChangeName = GlobalKey();
  final GlobalKey<FormState> formKeyChangeNumber = GlobalKey();
  final GlobalKey<FormState> formKeyChangePrice = GlobalKey();
  final GlobalKey<FormState> formKeyChangeManager = GlobalKey();
  final GlobalKey<FormState> formKeyChangeOwner = GlobalKey();
  final GlobalKey<FormState> formKeyChangeArea = GlobalKey();
  final GlobalKey<FormState> formKeyChangeCity = GlobalKey();
  final GlobalKey<FormState> formKeyChangeTax = GlobalKey();
  final GlobalKey<FormState> formKeyChangeDurationPerDay = GlobalKey();

  final DateTime dateNow = MyDateUtil.currentDateTimeFromDevice();
  final DateTime firstDate = MyDateUtil.currentDateTimeFromDevice()
      .subtract(const Duration(days: 365 * 20));
  final DateTime lastDate = MyDateUtil.currentDateTimeFromDevice()
      .add(const Duration(days: 365 * 20));

  bool projectReceiptDateValidator = true;
  bool projectDatePoValidator = true;

  void validatorProjectReceiptDateField() {
    if (projectReceiptDate == null) {
      projectReceiptDateValidator = false;
      emit(UpdateProjectInitial());
    } else {
      projectReceiptDateValidator = true;
      emit(UpdateProjectInitial());
    }
  }

  void validatorTakePoFileField() {
    if (projectDatePo == null) {
      projectDatePoValidator = false;
      emit(UpdateProjectInitial());
    } else {
      projectDatePoValidator = true;
      emit(UpdateProjectInitial());
    }
  }

  String calculateProjectEndDate({
    required ProjectDetails projectDetails,
  }) {
    return MyDateUtil.convertDateTime(
      historyAsText: MyDateUtil.covertStringToDate(
        date: projectDetails.projectReceiptDate!,
      ).add(Duration(days: projectDetails.projectDurationPerDay!)).toString(),
    );
  }

  Future<void> changeProjectName({
    required String newName,
    required ProjectDetails projectDetails,
  }) async {
    emit(UpdateProjectLoading());
    Either<Failures, void> result = await _projectInfoRepo.changeProjectName(
      newName: newName,
      projectDetails: projectDetails,
    );
    result.fold(
      (failures) => emit(
        UpdateProjectFailure(errMessage: failures.errMessage),
      ),
      (result) {
        projectDetails.projectName = newName;
        emit(UpdateProjectSuccess());
      },
    );
  }

  Future<void> changeProjectNumber({
    required String newNumber,
    required ProjectDetails projectDetails,
  }) async {
    emit(UpdateProjectLoading());
    Either<Failures, void> result = await _projectInfoRepo.changeProjectNumber(
      newNumber: newNumber,
      projectDetails: projectDetails,
    );
    result.fold(
      (failures) => emit(
        UpdateProjectFailure(errMessage: failures.errMessage),
      ),
      (result) {
        projectDetails.projectNumber = newNumber;
        emit(UpdateProjectSuccess());
      },
    );
  }

  Future<void> changeProjectPrice({
    required double newPrice,
    required ProjectDetails projectDetails,
  }) async {
    emit(UpdateProjectLoading());
    Either<Failures, void> result = await _projectInfoRepo.changeProjectPrice(
      newPrice: newPrice,
      projectDetails: projectDetails,
    );
    result.fold(
      (failures) => emit(
        UpdateProjectFailure(errMessage: failures.errMessage),
      ),
      (result) {
        projectDetails.projectPrice = newPrice;
        emit(UpdateProjectSuccess());
      },
    );
  }

  Future<void> changeProjectManager({
    required String newManager,
    required ProjectDetails projectDetails,
  }) async {
    emit(UpdateProjectLoading());
    Either<Failures, void> result = await _projectInfoRepo.changeProjectManager(
      newManager: newManager,
      projectDetails: projectDetails,
    );
    result.fold(
      (failures) => emit(
        UpdateProjectFailure(errMessage: failures.errMessage),
      ),
      (result) {
        projectDetails.projectManager = newManager;
        emit(UpdateProjectSuccess());
      },
    );
  }

  Future<void> changeProjectOwner({
    required String newOwner,
    required ProjectDetails projectDetails,
  }) async {
    emit(UpdateProjectLoading());
    Either<Failures, void> result = await _projectInfoRepo.changeProjectOwner(
      newOwner: newOwner,
      projectDetails: projectDetails,
    );
    result.fold(
      (failures) => emit(
        UpdateProjectFailure(errMessage: failures.errMessage),
      ),
      (result) {
        projectDetails.projectOwner = newOwner;
        emit(UpdateProjectSuccess());
      },
    );
  }

  Future<void> changeProjectArea({
    required String newArea,
    required ProjectDetails projectDetails,
  }) async {
    emit(UpdateProjectLoading());
    Either<Failures, void> result = await _projectInfoRepo.changeProjectArea(
      newArea: newArea,
      projectDetails: projectDetails,
    );
    result.fold(
      (failures) => emit(
        UpdateProjectFailure(errMessage: failures.errMessage),
      ),
      (result) {
        projectDetails.projectArea = newArea;
        emit(UpdateProjectSuccess());
      },
    );
  }

  Future<void> changeProjectCity({
    required String newCity,
    required ProjectDetails projectDetails,
  }) async {
    emit(UpdateProjectLoading());
    Either<Failures, void> result = await _projectInfoRepo.changeProjectCity(
      newCity: newCity,
      projectDetails: projectDetails,
    );
    result.fold(
      (failures) => emit(
        UpdateProjectFailure(errMessage: failures.errMessage),
      ),
      (result) {
        projectDetails.projectCity = newCity;
        emit(UpdateProjectSuccess());
      },
    );
  }

  Future<void> changeProjectValueAddedTax({
    required double newTax,
    required ProjectDetails projectDetails,
  }) async {
    emit(UpdateProjectLoading());
    Either<Failures, void> result =
        await _projectInfoRepo.changeProjectValueAddedTax(
      newTax: newTax,
      projectDetails: projectDetails,
    );
    result.fold(
      (failures) => emit(
        UpdateProjectFailure(errMessage: failures.errMessage),
      ),
      (result) {
        projectDetails.projectValueAddedTax = newTax;
        emit(UpdateProjectSuccess());
      },
    );
  }

  Future<void> changeDurationPerDay({
    required int newDuration,
    required ProjectDetails projectDetails,
  }) async {
    emit(UpdateProjectLoading());
    Either<Failures, void> result = await _projectInfoRepo.changeDurationPerDay(
      newDuration: newDuration,
      projectDetails: projectDetails,
    );
    result.fold(
      (failures) => emit(
        UpdateProjectFailure(errMessage: failures.errMessage),
      ),
      (result) {
        projectDetails.projectDurationPerDay = newDuration;
        emit(UpdateProjectSuccess());
      },
    );
  }

  Future<void> changeProjectReceiptDate({
    required String newDate,
    required ProjectDetails projectDetails,
  }) async {
    emit(UpdateProjectLoading());
    Either<Failures, void> result =
        await _projectInfoRepo.changeProjectReceiptDate(
      newDate: newDate,
      projectDetails: projectDetails,
    );
    result.fold(
      (failures) => emit(
        UpdateProjectFailure(errMessage: failures.errMessage),
      ),
      (result) {
        projectDetails.projectReceiptDate = newDate;
        emit(UpdateProjectSuccess());
      },
    );
  }

  Future<void> changeProjectDatePo({
    required String newDate,
    required ProjectDetails projectDetails,
  }) async {
    emit(UpdateProjectLoading());
    Either<Failures, void> result = await _projectInfoRepo.changeProjectDatePo(
      newDate: newDate,
      projectDetails: projectDetails,
    );
    result.fold(
      (failures) => emit(
        UpdateProjectFailure(errMessage: failures.errMessage),
      ),
      (result) {
        projectDetails.projectDatePo = newDate;
        emit(UpdateProjectSuccess());
      },
    );
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
    emit(UpdateProjectInitial());
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
    emit(UpdateProjectInitial());
  }

  Future<void> openFile(String url) async {
    // Open file in external application (browser or appropriate viewer)
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
