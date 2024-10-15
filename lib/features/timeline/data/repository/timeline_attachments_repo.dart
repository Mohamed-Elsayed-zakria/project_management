import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class TimelineAttachmentsRepo extends BaseServices {
  Future<Either<Failures, String>> addTimeLineTableFile();
  Future<Either<Failures, void>> addTimeLineTable({
    required String projectId,
  });
}
