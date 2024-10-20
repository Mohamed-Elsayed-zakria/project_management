import '/features/timeline/data/models/timeline_structure.dart';
import '/core/services/timeline_table_services.dart';
import 'package:file_picker/file_picker.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:excel/excel.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';
import 'timeline_repo.dart';
import 'dart:io';

class TimelineImplement extends TimelineRepo {
  @override
  Future<Either<Failures, List<TimelineStructure>>> addTimeLineTable({
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

      String filePath = result.files.single.path!;
      String generatId = const Uuid().v1();
      String fileName = result.files.single.name;

      String url =
          "${APIEndPoint.url}${APIEndPoint.timelineAttachments}/$projectId";

      await dio.post(
        url,
        data: FormData.fromMap({
          'tableFile': await MultipartFile.fromFile(
            filePath,
            filename: "$generatId-$fileName",
          ),
        }),
      );

      // قراءة الملف المختار
      var bytes = File(filePath).readAsBytesSync();
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
                projectId: projectId,
                activityID: row[0]?.value?.toString(),
                activityName: row[1]?.value?.toString(),
                start: row[2]?.value?.toString(),
                finish: row[3]?.value?.toString(),
                actualStart: row[4]?.value?.toString(),
                actualFinish: row[5]?.value?.toString(),
                complete: row[6]?.value?.toString(),
              ))
          .toList();
      await TimelineTableServices.storeTimelineList(
        timelineList: timelineData,
      );
      return right(timelineData);
    } catch (e) {
      return left(returnDioException(e));
    }
  }

  @override
  Future<Either<Failures, List<TimelineStructure>>> getTimeLineTableFromClaude({
    required String projectId,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.timelineAttachments}/$projectId";
      final response = await dio.get(url);

      // Extracting the latest "tableFile" from the list
      final dataList = response.data["data"] as List;
      if (dataList.isNotEmpty) {
        // Assuming you want the most recent "tableFile" based on "createdAt"
        final latestData = dataList.reduce((a, b) {
          DateTime aDate = DateTime.parse(a["createdAt"]);
          DateTime bDate = DateTime.parse(b["createdAt"]);
          return aDate.isAfter(bDate) ? a : b;
        });

        // Construct the file URL
        String fileUrl =
            "${APIEndPoint.mediaBaseUrl}${latestData["tableFile"]}";

        // Download the file
        final fileResponse = await dio.get(
          fileUrl,
          options: Options(responseType: ResponseType.bytes),
        );

        // Decode the bytes to Excel
        var excel = Excel.decodeBytes(fileResponse.data);

        // الحصول على أول ورقة في الملف
        var sheet = excel.tables[excel.tables.keys.first];
        if (sheet == null) {
          return left(LocalFailures.errorMessage(error: 'No data found.'));
        }

        // البحث عن الصف الذي يحتوي على "Activity ID"
        int startIndex = sheet.rows.indexWhere(
          (row) => row.isNotEmpty && row[0]?.value?.toString() == "Activity ID",
        );

        if (startIndex == -1) {
          return left(
              LocalFailures.errorMessage(error: 'Activity ID not found.'));
        }

        // قراءة البيانات من الصفوف التالية وتحويلها إلى كائنات TimelineStructure
        List<TimelineStructure> timelineData = sheet.rows
            .skip(startIndex + 1)
            .where((row) => row.length >= 7)
            .map((row) => TimelineStructure(
                  projectId: projectId,
                  activityID: row[0]?.value?.toString(),
                  activityName: row[1]?.value?.toString(),
                  start: row[2]?.value?.toString(),
                  finish: row[3]?.value?.toString(),
                  actualStart: row[4]?.value?.toString(),
                  actualFinish: row[5]?.value?.toString(),
                  complete: row[6]?.value?.toString(),
                ))
            .toList();
        await TimelineTableServices.storeTimelineList(
          timelineList: timelineData,
        );
        return right(timelineData);
      } else {
        return left(Failures(errMessage: "No data available"));
      }
    } catch (e) {
      return left(returnDioException(e));
    }
  }
}
