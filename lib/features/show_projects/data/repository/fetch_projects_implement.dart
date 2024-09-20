import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'fetch_projects_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchProjectsImplement extends FetchProjectsRepo {
  @override
  Future<Either<Failures, List<ProjectDetails>>> fetchAllProjects() async {
    try {
      const String url = "${APIEndPoint.url}${APIEndPoint.projects}";
      final response = await dio.get(url);
      final session = (response.data["data"] as List)
          .map((data) => ProjectDetails.fromJson(data))
          .toList();
      return right(session);
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
