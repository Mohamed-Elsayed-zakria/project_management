import 'package:file_picker/file_picker.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class PickFile {
  static Future<Either<Failures, String>> pick({
    FileType type = FileType.any,
  }) async {
    try {
      // Pick any file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: type, // Allows picking any type of file
      );
      if (result != null) {
        String? filePath = result.files.single.path;
        if (filePath != null) {
          return right(filePath);
        } else {
          return left(
            LocalFailures.errorMessage(
              error: "No file selected",
            ),
          );
        }
      } else {
        return left(
          LocalFailures.errorMessage(
            error: "No file selected",
          ),
        );
      }
    } catch (e) {
      return left(
        LocalFailures.errorMessage(
          error: "An error occurred while uploading the file.",
        ),
      );
    }
  }
}
