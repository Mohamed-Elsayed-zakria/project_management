import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/boq/data/models/boq_data/boq_data.dart';
import '/features/boq/data/models/boq_data/boq_item.dart';
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
    required BoqData boqData,
    required ProjectDetails projectDetails,
  }) {
    double total = 0.0;
    double percentage = 0.0;
    boqData.boqItems?.forEach((element) {
      total += element.totalPrice ?? 0.0;
    });

    percentage = double.parse(
      (total / (projectDetails.projectPrice ?? 0.0)).toStringAsFixed(2),
    );

    return percentage;
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
}
