import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'project_info_repo.dart';
import 'package:dio/dio.dart';

class ProjectInfoImplement extends ProjectInfoRepo {
  @override
  Future<Either<Failures, void>> changeDurationPerDay({
    required int newDuration,
    required ProjectDetails projectDetails,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.projects}/${APIEndPoint.projectDurationPerDay}/${projectDetails.id}";
      await dio.patch(
        url,
        data: {
          "projectDurationPerDay": newDuration,
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }
}
