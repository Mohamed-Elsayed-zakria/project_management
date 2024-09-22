import '/features/show_projects/data/models/boq_data/boq_data.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class BoqRepo extends BaseServices {
  Future<Either<Failures, List<BoqData>>> fetchAllBoq({
    required String projectId,
  });

  Future<Either<Failures, void>> addNewBoq({
    required String projectId,
    required String name,
  });
}
