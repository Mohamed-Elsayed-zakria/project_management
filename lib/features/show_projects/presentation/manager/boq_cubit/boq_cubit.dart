import 'package:flutter/widgets.dart';

import '/features/show_projects/data/models/boq_data/boq_data.dart';
import '/features/show_projects/data/repository/boq_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'boq_state.dart';

class BoqCubit extends Cubit<BoqState> {
  final BoqRepo _boqRepo;
  BoqCubit(this._boqRepo) : super(BoqInitial());

  TextEditingController addNewBoqController = TextEditingController();
  final GlobalKey<FormState> formKeyBoq = GlobalKey();

  Future<void> fetchAllBoq({
    required String projectId,
  }) async {
    emit(BoqLoading());
    Either<Failures, List<BoqData>> result = await _boqRepo.fetchAllBoq(
      projectId: projectId,
    );
    result.fold(
      (failures) => emit(BoqFailure(errMessage: failures.errMessage)),
      (result) => emit(BoqSuccess(result)),
    );
  }

  Future<void> addNewBoq({
    required String projectId,
    required String name,
  }) async {
    emit(AddBoqLoading());
    Either<Failures, void> result = await _boqRepo.addNewBoq(
      projectId: projectId,
      name: name,
    );
    result.fold(
      (failures) => emit(AddBoqFailure(errMessage: failures.errMessage)),
      (result) => emit(AddBoqSuccess()),
    );
  }
}
