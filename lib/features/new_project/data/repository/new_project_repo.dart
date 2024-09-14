import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class NewProjectRepo {
  Future<Either<Failures, void>> createNewProject();
}
