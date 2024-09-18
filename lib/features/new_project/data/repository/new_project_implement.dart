import '/features/new_project/data/models/new_project_model.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'new_project_repo.dart';

class NewProjectImplement extends NewProjectRepo {
  @override
  Future<Either<Failures, void>> createNewProject({
    required NewProjectModel projectBasicData,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(null);
    } catch (e) {
      return left(LocalFailures.errorMessage());
    }
  }

  @override
  Future<Either<Failures, void>> pickFilePo() async {
    try {
      return right(null);
    } catch (e) {
      return left(
        LocalFailures.errorMessage(error: "حدث خطأ أثناء تحميل الملف"),
      );
    }
  }

  @override
  Future<Either<Failures, void>> pickFileBoq() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(null);
    } catch (e) {
      return left(LocalFailures.errorMessage());
    }
  }
}
