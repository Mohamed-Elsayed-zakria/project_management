import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'project_info_repo.dart';
import 'package:dio/dio.dart';

class ProjectInfoImplement extends ProjectInfoRepo {
  @override
  Future<Either<Failures, void>> changeProjectName({
    required String newName,
    required ProjectDetails projectDetails,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.projects}/${projectDetails.id}";
      await dio.put(
        url,
        data: {
          "projectName": newName,
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failures, void>> changeProjectNumber({
    required String newNumber,
    required ProjectDetails projectDetails,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.projects}/${projectDetails.id}";
      await dio.put(
        url,
        data: {
          "projectNumber": newNumber,
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failures, void>> changeProjectPrice({
    required double newPrice,
    required ProjectDetails projectDetails,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.projects}/${projectDetails.id}";
      await dio.put(
        url,
        data: {
          "projectPrice": newPrice,
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failures, void>> changeProjectManager({
    required String newManager,
    required ProjectDetails projectDetails,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.projects}/${projectDetails.id}";
      await dio.put(
        url,
        data: {
          "projectManager": newManager,
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failures, void>> changeProjectOwner({
    required String newOwner,
    required ProjectDetails projectDetails,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.projects}/${projectDetails.id}";
      await dio.put(
        url,
        data: {
          "projectOwner": newOwner,
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failures, void>> changeProjectArea({
    required String newArea,
    required ProjectDetails projectDetails,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.projects}/${projectDetails.id}";
      await dio.put(
        url,
        data: {
          "projectArea": newArea,
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failures, void>> changeProjectCity({
    required String newCity,
    required ProjectDetails projectDetails,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.projects}/${projectDetails.id}";
      await dio.put(
        url,
        data: {
          "projectCity": newCity,
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failures, void>> changeProjectValueAddedTax({
    required double newTax,
    required ProjectDetails projectDetails,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.projects}/${projectDetails.id}";
      await dio.put(
        url,
        data: {
          "projectValueAddedTax": newTax,
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failures, void>> changeDurationPerDay({
    required int newDuration,
    required ProjectDetails projectDetails,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.projects}/${projectDetails.id}";
      await dio.put(
        url,
        data: {
          "projectDurationPerDay": newDuration,
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failures, void>> changeProjectReceiptDate({
    required String newDate,
    required ProjectDetails projectDetails,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.projects}/${projectDetails.id}";
      await dio.put(
        url,
        data: {
          "projectReceiptDate": newDate,
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failures, void>> changeProjectDatePo({
    required String newDate,
    required ProjectDetails projectDetails,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.projects}/${projectDetails.id}";
      await dio.put(
        url,
        data: {
          "projectDatePo": newDate,
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }
}
