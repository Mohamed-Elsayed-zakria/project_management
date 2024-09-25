import '/features/letters/data/models/letter_data/letter_data.dart';
import '/features/letters/data/models/add_letter.dart';
import 'package:file_picker/file_picker.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'letters_repo.dart';

class LettersImplement extends LettersRepo {
  @override
  Future<Either<Failures, String>> pickLetterFile() async {
    try {
      // Pick any file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any, // Allows picking any type of file
      );
      if (result != null) {
        String? filePath = result.files.single.path;
        if (filePath != null) {
          return right(filePath);
        } else {
          return left(
            LocalFailures.errorMessage(error: "لم يتم اختيار أي ملف"),
          );
        }
      } else {
        return left(
          LocalFailures.errorMessage(error: "لم يتم اختيار أي ملف"),
        );
      }
    } catch (e) {
      return left(
        LocalFailures.errorMessage(error: "حدث خطأ أثناء تحميل الملف"),
      );
    }
  }

  @override
  Future<Either<Failures, LetterData>> addNewLetter({
    required AddLetter newLetterDate,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.letters}/${newLetterDate.projectId}";
      final response = await dio.post(
        url,
        data: newLetterDate.toFormDataJson(
          letterFilePath: newLetterDate.letterFile,
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
  }) async {
    try {
      String url = "${APIEndPoint.url}${APIEndPoint.letters}/$projectId";
      final response = await dio.get(
        url,
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
