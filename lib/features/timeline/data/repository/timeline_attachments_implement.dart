import 'package:project_management/core/services/timeline_table_services.dart';

import '/features/timeline/data/repository/timeline_attachments_repo.dart';
import '/features/timeline/data/models/timeline_structure.dart';
import 'package:file_picker/file_picker.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:excel/excel.dart';
import 'dart:io';

class TimelineAttachmentsImplement extends TimelineAttachmentsRepo {
  @override
  Future<Either<Failures, void>> addTimeLineTable({
    required String projectId,
  }) async {
    try {
      // فتح متصفح الملفات لاختيار ملف Excel
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx', 'xls', 'xlsm'],
      );

      // التأكد من اختيار ملف
      if (result == null) {
        return left(
          LocalFailures.errorMessage(error: 'No file selected.'),
        );
      }

      // قراءة الملف المختار
      var bytes = File(result.files.single.path!).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      // الحصول على أول ورقة في الملف
      var sheet = excel.tables[excel.tables.keys.first];
      if (sheet == null) {
        return left(
          LocalFailures.errorMessage(error: 'No data found.'),
        );
      }

      // البحث عن الصف الذي يحتوي على "Activity ID"
      int startIndex = sheet.rows.indexWhere(
        (row) => row.isNotEmpty && row[0]?.value?.toString() == "Activity ID",
      );

      if (startIndex == -1) {
        return left(
          LocalFailures.errorMessage(error: 'Activity ID not found.'),
        );
      }

      // قراءة البيانات من الصفوف التالية وتحويلها إلى كائنات TimelineStructure
      List<TimelineStructure> timelineData = sheet.rows
          .skip(startIndex + 1)
          .where((row) => row.length >= 7)
          .map((row) => TimelineStructure(
                activityID: row[0]?.value?.toString(),
                activityName: row[1]?.value?.toString(),
                start: row[2]?.value?.toString(),
                finish: row[3]?.value?.toString(),
                actualStart: row[4]?.value?.toString(),
                actualFinish: row[5]?.value?.toString(),
                complete: row[6]?.value?.toString(),
              ))
          .toList();
      await TimelineTableServices.storeTimelineItem(
        timelineData: timelineData,
        projectId: projectId,
      );
      return right(null);
    } catch (e) {
      return left(
        LocalFailures.errorMessage(error: e.toString()),
      );
    }
  }
}
