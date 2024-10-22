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
  final String projectFilePo;
  double? projectValueAddedTax;
  List<dynamic>? holidays;

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
    required this.projectReceiptDate,
    required this.projectFilePo,
    this.projectValueAddedTax,
    this.holidays,
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
      'projectReceiptDate': projectReceiptDate,
      'projectManager': projectManager,
      'projectOwner': projectOwner,
      'projectArea': projectArea,
      'projectCity': projectCity,
      'projectFilePo': MultipartFile.fromFileSync(
        filePoPath,
        filename: "$generatId-$fileName",
      ),
      'projectValueAddedTax': projectValueAddedTax,
      'holidays': holidays,
    });
    return formData;
  }
}
