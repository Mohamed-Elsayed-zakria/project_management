import '/features/boq/data/models/boq_data/boq_item.dart';
import '/features/boq/data/models/boq_data/boq_data.dart';
import '/features/boq/data/models/add_boq_item.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
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
      return left(returnDioException(e));
    }
  }

  @override
  Future<Either<Failures, BoqData>> addNewBoq({
    required String projectId,
    required String name,
  }) async {
    try {
      String url = "${APIEndPoint.url}${APIEndPoint.boq}/project/$projectId";
      final response = await dio.post(
        url,
        data: {
          "name": name,
        },
      );
      final session = response.data["data"];
      BoqData boqData = BoqData.fromJson(session);
      return right(boqData);
    } catch (e) {
      return left(returnDioException(e));
    }
  }

  @override
  Future<Either<Failures, BoqItem>> addNewBoqItem({
    required AddBoqItem boqItemData,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.boqItem}/boq/${boqItemData.boqId}";
      final response = await dio.post(
        url,
        data: boqItemData.toJson(),
      );
      final session = response.data["data"];
      BoqItem boqItem = BoqItem.fromJson(session);
      return right(boqItem);
    } catch (e) {
      return left(returnDioException(e));
    }
  }
}
