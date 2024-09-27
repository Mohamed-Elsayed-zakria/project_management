import '/features/boq/data/models/boq_data/boq_item.dart';
import '/features/boq/data/models/boq_data/boq_data.dart';
import '/features/boq/data/models/add_boq_item.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class BoqRepo extends BaseServices {
  Future<Either<Failures, List<BoqData>>> fetchAllBoq({
    required String projectId,
  });

  Future<Either<Failures, BoqData>> addNewBoq({
    required String projectId,
    required String name,
  });

  Future<Either<Failures, BoqItem>> addNewBoqItem({
    required AddBoqItem boqItemData,
  });

  Future<Either<Failures, BoqItem>> updateQuantityBoqItem({
    required String boqItemId,
    required int newQuantity,
  });
}
