import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alice/alice.dart';

import '../main.dart';
import 'core/api_client.dart';
import 'core/interceptor/retry_Interceptor.dart';

///For server api call
abstract class NetConnect {
  late Dio _dio;

  late ApiClient _apiClient;

  ApiClient get client => _apiClient;

  late Alice _alice;

  NetConnect() {
    _dio = Dio();
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      logPrint: (value) => debugPrint('LogInterceptor => $value'),
    ));
    _dio.interceptors.add(RetryInterceptor(_dio));
    _alice = Alice(showNotification: true, navigatorKey: navigatorKey);
    _dio.interceptors.add(_alice.getDioInterceptor());
    _apiClient = ApiClient(_dio);
  }
}
