import 'package:dio/dio.dart';

class RetryInterceptor extends InterceptorsWrapper {
  final Dio _dio;

  RetryInterceptor(this._dio);

  final accessToken = "your access token";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    if (err.response != null) {
      if (err.response!.statusCode == 401) {
        _dio.interceptors.requestLock.lock();
        _dio.interceptors.responseLock.lock();
        RequestOptions requestOptions = err.requestOptions;

        await refreshToken();

        final opts = Options(method: requestOptions.method);
        _dio.options.headers["Authorization"] = "Bearer $accessToken";
        _dio.options.headers["Accept"] = "*/*";
        _dio.interceptors.requestLock.unlock();
        _dio.interceptors.responseLock.unlock();

        Response? response = await _dio.request(
          requestOptions.path,
          options: opts,
          cancelToken: requestOptions.cancelToken,
          onReceiveProgress: requestOptions.onReceiveProgress,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
        );

        if (response.statusMessage != null) {
          return handler.resolve(response);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } else {
      return handler.next(err);
    }
  }

  Future<void> refreshToken() async {
    final refreshToken = accessToken;
    final response = await _dio.post(
      '/auth/refresh',
      data: {
        'refreshToken': refreshToken,
      },
    );

    if (response.statusCode == 201) {
      //accessToken = response.data['accessToken'];
    } else {
      //accessToken = null;
    }
  }
}
