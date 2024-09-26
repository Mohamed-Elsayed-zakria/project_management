import '/features/forms/data/models/form_data/form_data.dart';
import '/features/forms/data/repository/forms_repo.dart';
import '/features/forms/data/models/add_form_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'add_form_state.dart';

class AddFormCubit extends Cubit<AddFormState> {
  final FormsRepo _formsRepo;

  AddFormCubit(this._formsRepo) : super(AddFormInitial());

  final TextEditingController formDescreptionText = TextEditingController();
  final TextEditingController formNumberText = TextEditingController();

  final GlobalKey<FormState> formKeyForms = GlobalKey();

  String? addFormFile;

  Future<void> pickFormFile() async {
    Either<Failures, String> result = await _formsRepo.pickFormFile();
    result.fold(
      (failures) => emit(AddFormFailure(failures.errMessage)),
      (result) {
        addFormFile = result;
        emit(AddFormInitial());
      },
    );
  }

  Future<void> addNewForm({
    required AddFormModel newFormData,
  }) async {
    Either<Failures, FormData> result = await _formsRepo.addNewForm(
      newFormData: newFormData,
    );
    result.fold(
      (failures) => emit(AddFormFailure(failures.errMessage)),
      (result) {
        emit(AddFormSuccess());
      },
    );
  }
}
