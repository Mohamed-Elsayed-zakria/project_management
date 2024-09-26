import '/features/other_additions/data/models/other_additions_data/other_additions_data.dart';
import '/features/other_additions/data/models/add_other_additions_model.dart';
import 'package:file_picker/file_picker.dart';
import '/core/constant/api_end_point.dart';
import '/core/models/step_type.dart';
import '/core/errors/failures.dart';
import 'other_additions_repo.dart';
import 'package:dartz/dartz.dart';

class OtherAdditionsImplement extends OtherAdditionsRepo {
  @override
  Future<Either<Failures, String>> pickOtherAdditionsFile() async {
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
  Future<Either<Failures, List<OtherAdditionsData>>> getAllOtherAdditions({
    required String projectId,
    required StepType stepType,
  }) async {
    try {
      String url = "${APIEndPoint.url}${APIEndPoint.otherAdditions}/$projectId";
      final response = await dio.get(
        url,
        queryParameters: {
          "stepType": stepType.stepType,
          "stepTypeId": stepType.stepTypeId,
        },
      );
      final List<OtherAdditionsData> session = (response.data["data"] as List)
          .map((data) => OtherAdditionsData.fromJson(data))
          .toList();
      return right(session);
    } catch (e) {
      return left(returnDioException(e));
    }
  }

  @override
  Future<Either<Failures, OtherAdditionsData>> addNewOtherAdditions({
    required AddOtherAdditionsModel newFormData,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.otherAdditions}/${newFormData.projectId}";
      final response = await dio.post(
        url,
        data: newFormData.toFormDataJson(
          formFilePath: newFormData.formFile,
        ),
      );
      final session = response.data["data"];
      OtherAdditionsData boqItem = OtherAdditionsData.fromJson(session);
      return right(boqItem);
    } catch (e) {
      return left(returnDioException(e));
    }
  }
}
