import '/features/settings/data/models/add_project_settings.dart';
import '/features/settings/data/models/project_settings.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProjectSettingsRepo extends BaseServices {
  Future<Either<Failures, ProjectSettings>> getProjectSettings();
  Future<Either<Failures, ProjectSettings>> updateProjectSettings({
    required AddProjectSettings projectSettings,
  });
}
