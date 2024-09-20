import '/core/services/service_locator.dart';
import '/core/models/user_credentials.dart';
import '/core/services/auth_services.dart';
import '/core/services/base_service.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'dart:developer';
import 'dart:io';

class DioConfig extends BaseServices {
  void setupDio() {
    dio.interceptors.clear();
    if (!kIsWeb) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          HttpClient()
            ..badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
    }

    dio.interceptors.add(CustomInterceptor());
  }
}

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    UserCredentials? credentials = AuthServices.readCredentials();
    if (credentials != null && credentials.token != null) {
      options.headers['Authorization'] = "Bearer ${credentials.token}";
    }
    options.headers['Access-Control-Allow-Origin'] = '*';
    log("Request[${options.method}] => PATH: ${options.path}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    log("Response[${response.statusCode}] => PATH: ${response.requestOptions.path}");
    super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    log("Error[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    int statusCode = err.response?.statusCode ?? 0;
    String message = err.response?.data['message'] ?? '';
    if (statusCode == 401 && message == "Expired token please login again") {
      final result = await AuthServices.refreshToken();
      final dio = SetupLocator.locator<Dio>();
      await result.fold((failures) {
        // Handling token renewal failure
        handler.next(err); // Send the error to the original caller
      }, (result) async {
        // Update the token in headers
        err.requestOptions.headers['Authorization'] = 'Bearer ${result.token}';
        // Retry the original request
        final opts = Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers,
        );
        final cloneReq = await dio.request(
          err.requestOptions.path,
          options: opts,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );
        // Send the modified response to the original caller.
        handler.resolve(cloneReq);
      });
    } else {
      // If the error is not due to token expiration, send the error as usual.
      super.onError(err, handler);
    }
  }
}
