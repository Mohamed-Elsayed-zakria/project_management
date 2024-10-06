import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/boq/data/models/boq_data/boq_data.dart';
import '/features/boq/data/models/boq_data/boq_item.dart';
import '/features/boq/data/models/add_boq_item.dart';
import '/features/boq/data/repository/boq_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'boq_item_state.dart';

class BoqItemCubit extends Cubit<BoqItemState> {
  final BoqRepo _boqRepo;

  BoqItemCubit(this._boqRepo) : super(BoqItemInitial());

  final TextEditingController itemNumberGetText = TextEditingController();
  final TextEditingController itemGetText = TextEditingController();
  final TextEditingController quantityGetText = TextEditingController();
  final TextEditingController individualPriceGetText = TextEditingController();
  final TextEditingController updateQuantityGetText = TextEditingController();
  final GlobalKey<FormState> addBoqItemformKey = GlobalKey();
  final GlobalKey<FormState> updateFormKey = GlobalKey();

  double calculateTotalPrice({
    required BoqData boqData,
  }) {
    double total = 0.0;
    boqData.boqItems?.forEach((element) {
      total += element.totalPrice ?? 0.0;
    });
    return double.parse(total.toStringAsFixed(2));
  }

  double totalPriceIncludingTax({
    required BoqData boqData,
    required ProjectDetails projectDetails,
  }) {
    double total = 0.0;

    // Summing the total price of all boqItems
    boqData.boqItems?.forEach((element) {
      total += element.totalPrice ?? 0.0;
    });

    // Convert the value added tax to decimal (e.g., 15% becomes 0.15)
    double valueAddedTax =
        (projectDetails.projectValueAddedTax! / 100).toDouble();

    // Calculate total with tax
    double totalWithTax = total + (total * valueAddedTax);

    // Return the value formatted to two decimal places
    return double.parse(totalWithTax.toStringAsFixed(2));
  }

  double percentageTotalPrice({
    required List<BoqData> boqDataList,
    required BoqData boqData,
    required ProjectDetails projectDetails,
    required int index,
  }) {
    double primaryPrice = 0.0;
    double percentage = 0.0;

    boqData.boqItems?.forEach((element) {
      primaryPrice += element.totalPrice ?? 0.0;
    });

    if (index == 0) {
      percentage = primaryPrice / (projectDetails.projectPrice ?? 0.0);
    } else {
      double secondPrice = 0.0;
      boqDataList[index - 1].boqItems?.forEach((element) {
        secondPrice += element.totalPrice ?? 0.0;
      });
      percentage = primaryPrice / secondPrice;
    }

    return double.parse((percentage * 100).toStringAsFixed(2));
  }

  double percentageQuantity({
    required List<BoqData> boqDataList,
    required BoqItem boqItem,
    required int index,
  }) {
    num quantity = boqItem.quantity!;

    int itemNumber = boqItem.itemNumber!;

    boqDataList[index - 1].boqItems?.forEach(
      (element) {
        if (element.itemNumber == itemNumber) {
          quantity = element.quantity ?? 0.0;
        }
      },
    );

    return double.parse(
      (boqItem.quantity! / quantity * 100).toStringAsFixed(2),
    );
  }

  Future<void> addNewBoqItem({
    required AddBoqItem boqItemData,
    required BoqData boqData,
  }) async {
    emit(AddBoqItemLoading());
    Either<Failures, BoqItem> result = await _boqRepo.addNewBoqItem(
      boqItemData: boqItemData,
    );
    result.fold(
      (failures) => emit(AddBoqItemFailure(errMessage: failures.errMessage)),
      (result) {
        boqData.boqItems?.add(result);
        emit(AddBoqItemSuccess());
      },
    );
  }

  Future<void> updateQuantityBoqItem({
    required BoqItem boqItemData,
    required int newQuantity,
  }) async {
    emit(UpdateBoqItemLoading());
    Either<Failures, BoqItem> result = await _boqRepo.updateQuantityBoqItem(
      boqItemId: boqItemData.id!,
      newQuantity: newQuantity,
    );
    result.fold(
      (failures) => emit(UpdateBoqItemFailure(errMessage: failures.errMessage)),
      (result) {
        boqItemData.quantity = result.quantity;
        boqItemData.totalPrice = result.totalPrice;
        emit(UpdateBoqItemSuccess());
      },
    );
  }
}
