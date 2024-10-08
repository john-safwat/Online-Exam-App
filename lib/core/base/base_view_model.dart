import 'package:bloc/bloc.dart';
import 'package:online_exam_app/core/providers/language_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BaseViewModel<T> extends Cubit<T>{
  BaseViewModel(super.initialState);

  LanguageProvider? languageProvider;
  AppLocalizations? local;

}