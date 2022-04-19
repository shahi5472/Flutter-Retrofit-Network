import 'package:dio/dio.dart';

import 'core/api_client.dart';

abstract class NetConnect {
  late Dio _dio;

  late ApiClient apiClient;

  NetConnect() {
    _dio = Dio();
    apiClient = ApiClient(_dio);
  }
}
