import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'new_project_repo.dart';

class NewProjectImplement extends NewProjectRepo {
  @override
  Future<Either<Failures, void>> createNewProject() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(null);
    } catch (e) {
      return left(LocalFailures.errorMessage());
    }
  }
}
