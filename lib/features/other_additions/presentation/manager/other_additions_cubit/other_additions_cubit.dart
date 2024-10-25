import '/features/other_additions/data/models/other_additions_data/other_additions_data.dart';
import '/features/other_additions/data/models/add_other_additions_model.dart';
import '/features/other_additions/data/repository/other_additions_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import '/core/models/step_type.dart';
import '/core/utils/pick_file.dart';
import 'other_additions_state.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class OtherAdditionsCubit extends Cubit<OtherAdditionsState> {
  final OtherAdditionsRepo _otherAdditionsRepo;
  OtherAdditionsCubit(this._otherAdditionsRepo)
      : super(OtherAdditionsInitial());

  String? addOtherAdditionsFile;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController otherAdditionsNumber = TextEditingController();
  final TextEditingController otherAdditionsSubject = TextEditingController();

  List<OtherAdditionsData> otherAdditionsData = [];

  Future<void> pickOtherAdditionsFile() async {
    Either<Failures, String> result = await PickFile.pick();
    result.fold(
      (failure) => emit(PickFileFailure(failure.errMessage)),
      (result) {
        addOtherAdditionsFile = result;
        emit(PickFileSuccess());
      },
    );
  }

  Future<void> addNewOtherAdditions({
    required AddOtherAdditionsModel newFormData,
  }) async {
    emit(AddOtherAdditionsLoading());
    Either<Failures, OtherAdditionsData> result =
        await _otherAdditionsRepo.addNewOtherAdditions(
      newFormData: newFormData,
    );
    result.fold(
      (failures) => emit(AddOtherAdditionsFailure(failures.errMessage)),
      (result) {
        otherAdditionsData.add(result);
        emit(AddOtherAdditionsSuccess());
      },
    );
  }

  Future<void> getAllOtherAdditions({
    required String projectId,
    required StepType stepType,
  }) async {
    emit(OtherAdditionsLoading());
    Either<Failures, List<OtherAdditionsData>> result =
        await _otherAdditionsRepo.getAllOtherAdditions(
      projectId: projectId,
      stepType: stepType,
    );
    result.fold(
      (failures) => emit(OtherAdditionsFailure(failures.errMessage)),
      (result) {
        otherAdditionsData = result;
        emit(OtherAdditionsSuccess());
      },
    );
  }
}
