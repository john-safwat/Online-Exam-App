import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/app_exception.dart';
import 'package:online_exam_app/domain/core/results.dart';

@injectable
class ApiExecution {
  Future<Results<T>> execute<T>(Future<T> Function() apiCall) async {
    try {
      var response = await apiCall();
      return Success<T>(response);
    } on SocketException catch (e) {
      return Failure<T>(e);
    } on TimeoutException catch (e) {
      return Failure<T>(e);
    } on HttpException catch (e) {
      return Failure<T>(e);
    } on DioException catch (e) {
      return Failure<T>(e);
    } on FormatException catch (e) {
      return Failure<T>(e);
    } on IOException {
      return Failure<T>(InternetConnectionException());
    } catch (e) {
      return Failure<T>(e as Exception);
    }
  }

}