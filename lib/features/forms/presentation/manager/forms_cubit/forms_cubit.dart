import '/features/forms/data/models/form_data/form_data.dart';
import '/features/forms/data/repository/forms_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/models/step_type.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'forms_state.dart';

class FormsCubit extends Cubit<FormsState> {
  final FormsRepo _formsRepo;
  FormsCubit(this._formsRepo) : super(FormsInitial());

  List<FormData> formDataList = [];

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
