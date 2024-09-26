import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';

class AddOtherAdditionsModel {
  final String projectId;
  final String description;
  final String number;
  final String? formFile;
  final String? stepType;
  final String? stepTypeId;

  AddOtherAdditionsModel({
    required this.projectId,
    required this.description,
    required this.number,
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
        'description': description,
        'number': number,
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
      'description': description,
      'number': number,
      'stepType': stepType,
      'stepTypeId': stepTypeId,
    });
    return formData;
  }
}
