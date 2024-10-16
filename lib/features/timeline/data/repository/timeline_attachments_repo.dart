import '/features/timeline/data/models/timeline_structure.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class TimelineAttachmentsRepo extends BaseServices {
  Future<Either<Failures, List<TimelineStructure>>> addTimeLineTable({
    required String projectId,
  });
  Future<Either<Failures, List<TimelineStructure>>> getTimeLineTable({
    required String projectId,
  });
}
