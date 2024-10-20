import '/features/letters/data/models/letter_data/letter_data.dart';
import '/features/letters/data/models/add_letter.dart';
import '/core/services/base_service.dart';
import '/core/models/step_type.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LettersRepo extends BaseServices {
  Future<Either<Failures, LetterData>> addNewLetter({
    required AddLetter newLetterData,
  });

  Future<Either<Failures, List<LetterData>>> getAllLetter({
    required String projectId,
    required StepType stepType,
  });
}
