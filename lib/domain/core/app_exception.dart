import 'package:dio/dio.dart';

class InternetConnectionException implements Exception {
  InternetConnectionException();
}

class UnknownException implements Exception {
  String errorMessage;

  UnknownException({required this.errorMessage});
}

class ServerError implements Exception {
  String? serverMessage;
  int? statusCode;

  ServerError(this.serverMessage, this.statusCode);
}

class DioHttpException implements Exception {
  DioException? exception;

  DioHttpException(this.exception);
}
