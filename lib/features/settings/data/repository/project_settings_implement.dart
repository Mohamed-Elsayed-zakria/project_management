import '/features/settings/data/models/add_project_settings.dart';
import '/features/settings/data/models/project_settings.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'project_settings_repo.dart';
import 'package:dartz/dartz.dart';

class ProjectSettingsImplement extends ProjectSettingsRepo {
  @override
  Future<Either<Failures, ProjectSettings>> getProjectSettings() async {
    try {
      const String url = "${APIEndPoint.url}${APIEndPoint.projectSettings}";
      final response = await dio.get(url);
      final session = response.data["data"];
      ProjectSettings projectSettings = ProjectSettings.fromJson(session);
      return right(projectSettings);
    } catch (e) {
      return left(returnDioException(e));
    }
  }

  @override
  Future<Either<Failures, ProjectSettings>> updateProjectSettings({
    required AddProjectSettings projectSettings,
  }) async {
    try {
      const String url = "${APIEndPoint.url}${APIEndPoint.projectSettings}";
      final response = await dio.put(
        url,
        data: projectSettings.toJson(),
      );
      final session = response.data["data"];
      ProjectSettings companyData = ProjectSettings.fromJson(session);
      return right(companyData);
    } catch (e) {
      return left(returnDioException(e));
    }
  }
}
