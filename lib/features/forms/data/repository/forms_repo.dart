import '/features/forms/data/models/form_data/form_data.dart';
import '/features/forms/data/models/add_form_model.dart';
import '/core/services/base_service.dart';
import '/core/models/step_type.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class FormsRepo extends BaseServices {
  Future<Either<Failures, FormData>> addNewForm({
    required AddFormModel newFormData,
  });

  Future<Either<Failures, List<FormData>>> getAllForm({
    required String projectId,
    required StepType stepType,
  });
}
