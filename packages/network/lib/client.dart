import "package:dio/dio.dart";

import "dio_interceptor.dart";

class DioClient {
  static DioClient? _dioClient;
  static late Dio _dio;

  static late String baseURL;
  static late Duration ct;
  static late Duration rt;

  DioClient.init(String baseUrl, Duration connectTimeout, Duration receiveTimeout) {
    baseURL = baseUrl;
    ct = connectTimeout;
    rt = receiveTimeout;
  }

  factory DioClient() {
    _dioClient ??= DioClient._internal();
    return _dioClient!;
  }

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        connectTimeout: ct,
        receiveTimeout: rt,
        responseType: ResponseType.json,
      ),
    );
    _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio => _dio;

  void dispose() {
    _dio.close();
  }
}
