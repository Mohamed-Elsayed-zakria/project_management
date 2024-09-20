import 'package:dio/dio.dart';
import 'service_locator.dart';

class BaseServices {
  final dio = SetupLocator.locator<Dio>();
}
