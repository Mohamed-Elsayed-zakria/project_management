import '/features/letters/data/models/add_letter.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LettersRepo extends BaseServices {
  Future<Either<Failures, String>> pickLetterFile();
  Future<Either<Failures, void>> addNewLetter({
    required AddLetter newLetterDate,
  });
}
