import '/features/boq/data/models/boq_data/boq_data.dart';
import '/features/boq/data/repository/boq_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'fetch_boq_state.dart';

class FetchBoqCubit extends Cubit<FetchBoqState> {
  final BoqRepo _boqRepo;
  FetchBoqCubit(this._boqRepo) : super(FetchBoqInitial());

  List<BoqData> boqData = [];

  Future<void> fetchAllBoq({
    required String projectId,
  }) async {
    emit(FetchBoqLoading());
    Either<Failures, List<BoqData>> result = await _boqRepo.fetchAllBoq(
      projectId: projectId,
    );
    result.fold(
      (failures) => emit(FetchBoqFailure(errMessage: failures.errMessage)),
      (result) {
        boqData = result;
        emit(FetchBoqSuccess());
      },
    );
  }
}
