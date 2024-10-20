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

  static Future<Either<Failures, List<String>>> pickMultiple({
    FileType type = FileType.any,
  }) async {
    try {
      // Pick multiple files
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: type, // Allows picking any type of file
        allowMultiple: true, // Allow multiple file selection
      );

      if (result != null && result.files.isNotEmpty) {
        // Extract file paths from the selected files
        List<String> filePaths = result.files
            .map((file) => file.path)
            .where((path) => path != null) // Filter out any null paths
            .cast<String>() // Cast to List<String>
            .toList();

        return right(filePaths); // Return the list of file paths
      } else {
        return left(
          LocalFailures.errorMessage(
            error: "No files selected",
          ),
        );
      }
    } catch (e) {
      return left(
        LocalFailures.errorMessage(
          error: "An error occurred while uploading the files.",
        ),
      );
    }
  }
}
