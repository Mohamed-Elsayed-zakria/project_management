import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class FetchProjectsRepo extends BaseServices {
  Future<Either<Failures, List<ProjectDetails>>> fetchAllProjects();
}
