import '/features/boq/data/models/boq_data/boq_data.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'boq_repo.dart';

class BoqImplement extends BoqRepo {
  @override
  Future<Either<Failures, List<BoqData>>> fetchAllBoq({
    required String projectId,
  }) async {
    try {
      String url = "${APIEndPoint.url}${APIEndPoint.boq}/project/$projectId";
      final response = await dio.get(url);
      final session = (response.data["data"] as List)
          .map((data) => BoqData.fromJson(data))
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

  @override
  Future<Either<Failures, void>> addNewBoq({
    required String projectId,
    required String name,
  }) async {
    try {
      String url = "${APIEndPoint.url}${APIEndPoint.boq}/project/$projectId";
      await dio.post(
        url,
        data: {
          "name": name,
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
