import '/features/letters/data/models/letter_data/letter_data.dart';
import '/features/letters/data/models/add_letter.dart';
import '/core/constant/api_end_point.dart';
import '/core/models/step_type.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'letters_repo.dart';

class LettersImplement extends LettersRepo {
  @override
  Future<Either<Failures, LetterData>> addNewLetter({
    required AddLetter newLetterData,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.letters}/${newLetterData.projectId}";
      final response = await dio.post(
        url,
        data: newLetterData.toFormDataJson(
          letterFilePath: newLetterData.letterFile,
        ),
      );
      final session = response.data["data"];
      LetterData boqItem = LetterData.fromJson(session);
      return right(boqItem);
    } catch (e) {
      return left(returnDioException(e));
    }
  }

  @override
  Future<Either<Failures, List<LetterData>>> getAllLetter({
    required String projectId,
    required StepType stepType,
  }) async {
    try {
      String url = "${APIEndPoint.url}${APIEndPoint.letters}/$projectId";
      final response = await dio.get(
        url,
        queryParameters: {
          "stepType": stepType.stepType,
          "stepTypeId": stepType.stepTypeId,
        },
      );
      final List<LetterData> session = (response.data["data"] as List)
          .map((data) => LetterData.fromJson(data))
          .toList();
      return right(session);
    } catch (e) {
      return left(returnDioException(e));
    }
  }
}
