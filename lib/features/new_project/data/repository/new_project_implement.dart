import 'package:project_management/core/services/auth_services.dart';
import '/features/new_project/data/models/new_project_model.dart';
import 'package:file_picker/file_picker.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'new_project_repo.dart';

class NewProjectImplement extends NewProjectRepo {
  @override
  Future<Either<Failures, String>> pickFilePo() async {
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
