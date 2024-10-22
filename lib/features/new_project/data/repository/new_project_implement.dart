import '/features/new_project/data/models/new_project_model.dart';
import '/features/settings/data/models/project_settings.dart';
import '/core/constant/api_end_point.dart';
import '/core/services/auth_services.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'new_project_repo.dart';

class NewProjectImplement extends NewProjectRepo {
  @override
  Future<Either<Failures, void>> createNewProject({
    required NewProjectModel projectBasicData,
  }) async {
    String? currentUserId = AuthServices.currentUserId();
    try {
      if (currentUserId == null) {
        return left(
          ServerFailures(errMessage: 'Something went wrong'),
        );
      }
      const String projectUrl =
          "${APIEndPoint.url}${APIEndPoint.projectSettings}";
      final response = await dio.get(projectUrl);
      final session = response.data["data"];

      ProjectSettings projectSettings = ProjectSettings.fromJson(session);

      projectBasicData.projectValueAddedTax =
          double.parse(projectSettings.valueAddedTax.toString());

      projectBasicData.holidays = projectSettings.holidays;

      String url = "${APIEndPoint.url}${APIEndPoint.projects}/$currentUserId";

      await dio.post(
        url,
        data: projectBasicData.toFormDataJson(
          filePoPath: projectBasicData.projectFilePo,
        ),
      );
      return right(null);
    } catch (e) {
      return left(returnDioException(e));
    }
  }
}
