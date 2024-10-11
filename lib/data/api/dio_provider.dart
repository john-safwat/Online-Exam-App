import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/data/api/api_constants.dart';

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
    dio.interceptors.add(getIt<LogInterceptor>());
    return dio;
  }

  LogInterceptor providerInterceptor(){
    return LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true);
  }

}
