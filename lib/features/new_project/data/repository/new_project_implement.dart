import 'package:project_management/core/services/auth_services.dart';
import '/features/new_project/data/models/new_project_model.dart';
import '/core/constant/api_end_point.dart';
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
