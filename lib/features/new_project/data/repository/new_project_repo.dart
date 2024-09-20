import '/features/new_project/data/models/new_project_model.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class NewProjectRepo extends BaseServices {
  Future<Either<Failures, String>> pickFilePo();
  Future<Either<Failures, void>> createNewProject({
    required NewProjectModel projectBasicData,
  });
}
