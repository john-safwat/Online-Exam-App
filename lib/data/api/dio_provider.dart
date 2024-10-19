import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/data/api/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      baseUrl: ApiConstants.baseUrl,
    );
    dio.interceptors.add(getIt<PrettyDioLogger>());
    return dio;
  }

  PrettyDioLogger providerInterceptor() {
    return PrettyDioLogger(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true);
  }
}
