import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/core/providers/language_provider.dart';

class BaseViewModel<T> extends Cubit<T> {
  BaseViewModel(super.initialState);

  LanguageProvider? languageProvider;
  AppLocalizations? locale;


  String mapExceptionToMessage(Exception exception) {
    if (exception is SocketException) {
      return locale!.socketExceptionMessage;
    } else if (exception is TimeoutException) {
      return locale!.timeoutExceptionMessage;
    }else if (exception is HttpException) {
      return locale!.httpExceptionMessage;
    }else if (exception is DioException) {
      return locale!.dioResponseMessage;
    }else if (exception is FormatException) {
      return locale!.formatExceptionMessage;
    }else if (exception is IOException) {
      return locale!.ioExceptionMessage;
    }else {
      return locale!.dioDefaultMessage;
    }
  }
}
