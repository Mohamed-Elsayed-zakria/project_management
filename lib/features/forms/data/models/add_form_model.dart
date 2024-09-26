import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

class AddFormModel {
  final String projectId;
  final String formDescription;
  final String formNumber;
  final String? formFile;
  final String? stepType;
  final String? stepTypeId;

  AddFormModel({
    required this.projectId,
    required this.formDescription,
    required this.formNumber,
    required this.formFile,
    required this.stepType,
    required this.stepTypeId,
  });

  FormData toFormDataJson({required String? formFilePath}) {
    FormData formData;
    if (formFile != null) {
      String generatId = const Uuid().v1();
      String fileName = basename(formFile!);
      formData = FormData.fromMap({
        'projectId': projectId,
        'formDescription': formDescription,
        'formNumber': formNumber,
        'formFile': MultipartFile.fromFileSync(
          formFilePath!,
          filename: "$generatId-$fileName",
        ),
        'stepType': stepType,
        'stepTypeId': stepTypeId,
      });
      return formData;
    }
    formData = FormData.fromMap({
      'projectId': projectId,
      'formDescription': formDescription,
      'formNumber': formNumber,
      'stepType': stepType,
      'stepTypeId': stepTypeId,
    });
    return formData;
  }
}
