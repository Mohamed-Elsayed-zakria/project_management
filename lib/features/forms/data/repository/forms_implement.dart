import '/features/forms/data/models/form_data/form_data.dart';
import '/features/forms/data/models/add_form_model.dart';
import 'package:file_picker/file_picker.dart';
import '/core/constant/api_end_point.dart';
import '/core/models/step_type.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'forms_repo.dart';

class FormsImplement extends FormsRepo {
  @override
  Future<Either<Failures, String>> pickFormFile() async {
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
  Future<Either<Failures, FormData>> addNewForm({
    required AddFormModel newFormData,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.forms}/${newFormData.projectId}";
      final response = await dio.post(
        url,
        data: newFormData.toFormDataJson(
          formFilePath: newFormData.formFile,
        ),
      );
      final session = response.data["data"];
      FormData boqItem = FormData.fromJson(session);
      return right(boqItem);
    } catch (e) {
      return left(returnDioException(e));
    }
  }

  @override
  Future<Either<Failures, List<FormData>>> getAllForm({
    required String projectId,
    required StepType stepType,
  }) async {
    try {
      String url = "${APIEndPoint.url}${APIEndPoint.forms}/$projectId";
      final response = await dio.get(
        url,
        queryParameters: {
          "stepType": stepType.stepType,
          "stepTypeId": stepType.stepTypeId,
        },
      );
      final List<FormData> session = (response.data["data"] as List)
          .map((data) => FormData.fromJson(data))
          .toList();
      return right(session);
    } catch (e) {
      return left(returnDioException(e));
    }
  }
}
