import '/features/other_additions/data/models/other_additions_data/other_additions_data.dart';
import '/features/other_additions/data/models/add_other_additions_model.dart';
import '/core/services/base_service.dart';
import '/core/models/step_type.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class OtherAdditionsRepo extends BaseServices {
  Future<Either<Failures, List<OtherAdditionsData>>> getAllOtherAdditions({
    required String projectId,
    required StepType stepType,
  });

  Future<Either<Failures, OtherAdditionsData>> addNewOtherAdditions({
    required AddOtherAdditionsModel newFormData,
  });
}
