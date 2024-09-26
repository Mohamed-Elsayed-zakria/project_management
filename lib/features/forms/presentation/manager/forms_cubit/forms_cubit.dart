import '/features/forms/data/models/form_data/form_data.dart';
import '/features/forms/data/repository/forms_repo.dart';
import '/features/forms/data/models/add_form_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import '/core/models/step_type.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'forms_state.dart';

class FormsCubit extends Cubit<FormsState> {
  final FormsRepo _formsRepo;
  FormsCubit(this._formsRepo) : super(FormsInitial());

  final TextEditingController formDescreptionText = TextEditingController();
  final TextEditingController formNumberText = TextEditingController();

  final GlobalKey<FormState> formKeyForms = GlobalKey();

  String? addFormFile;

  List<FormData> formDataList = [];

  Future<void> pickFormFile() async {
    Either<Failures, String> result = await _formsRepo.pickFormFile();
    result.fold(
      (failures) => emit(AddFormFailure(failures.errMessage)),
      (result) {
        addFormFile = result;
        emit(FormsInitial());
      },
    );
  }

  Future<void> addNewForm({
    required AddFormModel newFormData,
  }) async {
    emit(AddFormLoading());
    Either<Failures, FormData> result = await _formsRepo.addNewForm(
      newFormData: newFormData,
    );
    result.fold(
      (failures) => emit(AddFormFailure(failures.errMessage)),
      (result) {
        formDataList.add(result);
        emit(AddFormSuccess());
      },
    );
  }

  Future<void> getAllForm({
    required String projectId,
    required StepType stepType,
  }) async {
    emit(FormsLoading());
    Either<Failures, List<FormData>> result = await _formsRepo.getAllForm(
      projectId: projectId,
      stepType: stepType,
    );
    result.fold(
      (failures) => emit(FormsFailure(failures.errMessage)),
      (result) {
        formDataList = result;
        emit(FormsSuccess());
      },
    );
  }
}
