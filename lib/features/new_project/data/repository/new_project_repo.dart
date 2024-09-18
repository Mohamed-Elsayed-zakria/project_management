import '/features/new_project/data/models/new_project_model.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class NewProjectRepo {
  Future<Either<Failures, void>> createNewProject({
    required NewProjectModel projectBasicData,
  });
  Future<Either<Failures, void>> pickFilePo();
  Future<Either<Failures, void>> pickFileBoq();
}
