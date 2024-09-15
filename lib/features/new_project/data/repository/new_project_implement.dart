import '/features/new_project/data/models/new_project_basic_data_model.dart';
import 'package:file_picker/file_picker.dart';
import '/core/errors/failures.dart';
import 'package:excel/excel.dart';
import 'package:dartz/dartz.dart';
import 'new_project_repo.dart';
import 'dart:io';

class NewProjectImplement extends NewProjectRepo {
  @override
  Future<Either<Failures, void>> createNewProject({
    required NewProjectBasicDataModel projectBasicData,
  }) async {
    try {
      print(
          "==> ${projectBasicData.projectName} ==> ${projectBasicData.projectNumber} ==> ${projectBasicData.projectPrice} ==> ${projectBasicData.projectDurationPerDay} ==> ${projectBasicData.projectDatePo} ==> ${projectBasicData.projectFilePo} ==> ${projectBasicData.projectFilesBoq}");
      await Future.delayed(const Duration(seconds: 1));
      return right(null);
    } catch (e) {
      return left(LocalFailures.errorMessage());
    }
  }

  @override
  Future<Either<Failures, void>> pickFilePo() async {
    try {
      // Pick the file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'], // Only allow Excel files
      );

      if (result != null) {
        // Get the selected file
        File file = File(result.files.single.path!);

        // Read the Excel file
        var bytes = file.readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);

        // Assuming the first sheet contains the data
        for (var table in excel.tables.keys) {
          var sheet = excel.tables[table]!;

          // Loop through rows and print Item No with Description
          for (var i = 1; i < sheet.rows.length; i++) {
            // Skip header row
            var row = sheet.rows[i];

            // Get Item No and Description, handling any null or invalid data
            var itemNo = row[0]?.value?.toString().trim() ??
                "N/A"; // Assuming first column is 'Item No'
            var description = row[1]?.value?.toString().trim() ??
                "N/A"; // Assuming second column is 'Description'

            // Check if the data is valid (skip empty or invalid rows)
            if (itemNo != "N/A" && description != "N/A") {
              print("بند $itemNo: $description");
            }
          }
        }
        return right(null);
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
  Future<Either<Failures, void>> pickFileBoq() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(null);
    } catch (e) {
      return left(LocalFailures.errorMessage());
    }
  }
}
