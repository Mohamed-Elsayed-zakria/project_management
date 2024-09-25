import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;
  Failures({required this.errMessage});
}

class LocalFailures extends Failures {
  LocalFailures({required super.errMessage});
  factory LocalFailures.errorMessage({String? error}) {
    switch (error) {
      case null:
        return LocalFailures(errMessage: 'Something went wrong');
      default:
        return LocalFailures(errMessage: error);
    }
  }
}

class ServerFailures extends Failures {
  ServerFailures({required super.errMessage});

  factory ServerFailures.fromDioError({required DioException dioError}) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailures(errMessage: 'Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailures(errMessage: 'Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailures(errMessage: 'Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailures(errMessage: 'Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailures.fromResponse(
          statusCode: dioError.response!.statusCode!,
          response: dioError.response!.data as Map<String, dynamic>,
        );
      case DioExceptionType.cancel:
        return ServerFailures(
          errMessage: 'Request to API server was cancelled',
        );
      case DioExceptionType.connectionError:
        return ServerFailures(errMessage: 'Connection error with API server');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailures(errMessage: 'No internet connection');
        }
        return ServerFailures(errMessage: 'Something went wrong');
      default:
        return ServerFailures(errMessage: 'Something went wrong');
    }
  }

  factory ServerFailures.fromResponse({
    required int statusCode,
    required Map<String, dynamic> response,
  }) {
    switch (statusCode) {
      case 400:
        try {
          return ServerFailures(
            errMessage: response.containsKey('message')
                ? response['message']
                : response.containsKey('errors') &&
                        response['errors'].isNotEmpty
                    ? response['errors'][0]['msg']
                    : 'Something went wrong',
          );
        } catch (e) {
          return ServerFailures(errMessage: 'Something went wrong');
        }
      case 401:
        return ServerFailures(errMessage: response['message']);
      case 403:
        return ServerFailures(errMessage: 'Forbidden');
      case 404:
        return ServerFailures(errMessage: 'Not found');
      case 429:
        return ServerFailures(errMessage: response['message']);
      case 500:
        return ServerFailures(errMessage: 'Internal server error');
      default:
        return ServerFailures(errMessage: 'Something went wrong');
    }
  }
}
