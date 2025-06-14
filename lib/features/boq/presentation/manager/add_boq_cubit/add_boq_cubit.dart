import '/features/boq/data/models/boq_data/boq_data.dart';
import '/features/boq/data/repository/boq_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'add_boq_state.dart';

class AddBoqCubit extends Cubit<AddBoqState> {
  final BoqRepo _boqRepo;

  AddBoqCubit(this._boqRepo) : super(AddBoqInitial());

  final TextEditingController addNewBoqController = TextEditingController();
  final GlobalKey<FormState> formKeyBoq = GlobalKey();

  Future<void> addNewBoq({
    required String projectId,
    required List<BoqData> boqData,
    required String name,
  }) async {
    emit(AddBoqLoading());
    Either<Failures, BoqData> result = await _boqRepo.addNewBoq(
      projectId: projectId,
      name: name,
    );
    result.fold(
      (failures) => emit(AddBoqFailure(errMessage: failures.errMessage)),
      (result) {
        boqData.add(result);
        emit(AddBoqSuccess());
      },
    );
  }
}
