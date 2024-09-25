import 'package:uuid/uuid.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';

class AddLetter {
  final String projectId;
  final String letterType;
  final String number;
  final String date;
  final String subject;
  final String type;
  final String replyTo;
  final String letterFile;
  final String? stepType;
  final String? stepTypeId;

  AddLetter({
    required this.projectId,
    required this.letterType,
    required this.number,
    required this.date,
    required this.subject,
    required this.type,
    required this.replyTo,
    required this.letterFile,
    required this.stepType,
    required this.stepTypeId,
  });

  FormData toFormDataJson({required String letterFilePath}) {
    String generatId = const Uuid().v1();
    String fileName = basename(letterFile);
    FormData formData = FormData.fromMap({
      'letterType': letterType,
      'number': number,
      'date': date,
      'subject': subject,
      'type': type,
      'replyTo': replyTo,
      'letterFile': MultipartFile.fromFileSync(
        letterFilePath,
        filename: "$generatId-$fileName",
      ),
      'stepType': stepType,
      'stepTypeId': stepTypeId,
    });
    return formData;
  }
}
