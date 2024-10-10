import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/core/providers/language_provider.dart';

class BaseViewModel<T> extends Cubit<T> {
  BaseViewModel(super.initialState);

  LanguageProvider? languageProvider;
  AppLocalizations? local;


  String handleExceptions(Exception exception) {
    if (exception is SocketException) {
      return local!.socketExceptionMessage;
    } else if (exception is TimeoutException) {
      return local!.timeoutExceptionMessage;
    }else if (exception is HttpException) {
      return local!.httpExceptionMessage;
    }else if (exception is DioException) {
      return local!.dioResponseMessage;
    }else if (exception is FormatException) {
      return local!.formatExceptionMessage;
    }else if (exception is IOException) {
      return local!.ioExceptionMessage;
    }else {
      return local!.dioDefaultMessage;
    }
  }
}
