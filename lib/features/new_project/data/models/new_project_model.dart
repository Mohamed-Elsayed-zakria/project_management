import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';

class NewProjectModel {
  final String projectName;
  final String projectNumber;
  final double projectPrice;
  final int projectDurationPerDay;
  final String projectManager;
  final String projectOwner;
  final String projectArea;
  final String projectCity;
  final String projectDatePo;
  final String projectReceiptDate;
  final double projectValueAddedTax;
  final String projectFilePo;

  NewProjectModel({
    required this.projectName,
    required this.projectNumber,
    required this.projectPrice,
    required this.projectDurationPerDay,
    required this.projectManager,
    required this.projectOwner,
    required this.projectArea,
    required this.projectCity,
    required this.projectDatePo,
    required this.projectValueAddedTax,
    required this.projectReceiptDate,
    required this.projectFilePo,
  });

  FormData toFormDataJson({required String filePoPath}) {
    String generatId = const Uuid().v1();
    String fileName = basename(projectFilePo);
    FormData formData = FormData.fromMap({
      'projectName': projectName,
      'projectNumber': projectNumber,
      'projectPrice': projectPrice,
      'projectDurationPerDay': projectDurationPerDay,
      'projectDatePo': projectDatePo,
      'projectValueAddedTax': projectValueAddedTax,
      'projectReceiptDate': projectReceiptDate,
      'projectManager': projectManager,
      'projectOwner': projectOwner,
      'projectArea': projectArea,
      'projectCity': projectCity,
      'projectFilePo': MultipartFile.fromFileSync(
        filePoPath,
        filename: "$generatId-$fileName",
      ),
    });
    return formData;
  }
}
