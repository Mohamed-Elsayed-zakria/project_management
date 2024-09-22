import '/features/boq/data/models/add_boq_item.dart';
import '/features/boq/data/repository/boq_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'add_boq_item_state.dart';

class AddBoqItemCubit extends Cubit<AddBoqItemState> {
  final BoqRepo _boqRepo;

  AddBoqItemCubit(this._boqRepo) : super(AddBoqItemInitial());

  final TextEditingController itemNumberGetText = TextEditingController();
  final TextEditingController itemGetText = TextEditingController();
  final TextEditingController quantityGetText = TextEditingController();
  final TextEditingController individualPriceGetText = TextEditingController();
  final GlobalKey<FormState> addBoqItemformKey = GlobalKey();

  Future<void> addNewBoqItem({
    required AddBoqItem boqItemData,
  }) async {
    emit(AddBoqItemLoading());
    Either<Failures, void> result = await _boqRepo.addNewBoqItem(
      boqItemData: boqItemData,
    );
    result.fold(
      (failures) => emit(AddBoqItemFailure(errMessage: failures.errMessage)),
      (result) => emit(AddBoqItemSuccess()),
    );
  }
}
