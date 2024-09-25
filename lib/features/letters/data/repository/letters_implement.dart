import 'package:file_picker/file_picker.dart';
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
}
