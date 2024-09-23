import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProjectInfoRepo extends BaseServices {
  Future<Either<Failures, void>> changeProjectName({
    required String newName,
    required ProjectDetails projectDetails,
  });
  Future<Either<Failures, void>> changeProjectNumber({
    required String newNumber,
    required ProjectDetails projectDetails,
  });
  Future<Either<Failures, void>> changeProjectPrice({
    required double newPrice,
    required ProjectDetails projectDetails,
  });
  Future<Either<Failures, void>> changeProjectManager({
    required String newManager,
    required ProjectDetails projectDetails,
  });
  Future<Either<Failures, void>> changeProjectOwner({
    required String newOwner,
    required ProjectDetails projectDetails,
  });
  Future<Either<Failures, void>> changeProjectArea({
    required String newArea,
    required ProjectDetails projectDetails,
  });
  Future<Either<Failures, void>> changeProjectCity({
    required String newCity,
    required ProjectDetails projectDetails,
  });
  Future<Either<Failures, void>> changeProjectValueAddedTax({
    required double newTax,
    required ProjectDetails projectDetails,
  });
  Future<Either<Failures, void>> changeDurationPerDay({
    required int newDuration,
    required ProjectDetails projectDetails,
  });
  Future<Either<Failures, void>> changeProjectReceiptDate({
    required String newDate,
    required ProjectDetails projectDetails,
  });
  Future<Either<Failures, void>> changeProjectDatePo({
    required String newDate,
    required ProjectDetails projectDetails,
  });
}
