import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/constants.dart';
import 'package:online_exam_app/core/providers/app_config_provider.dart';
import 'package:online_exam_app/core/providers/language_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppInitializer {
  LanguageProvider languageProvider;
  AppConfigProvider appConfigProvider;
  SharedPreferences preferences;

  AppInitializer(
      this.languageProvider, this.appConfigProvider, this.preferences);

  init() {
    _initialLocale();
    _initialUserData();
  }

  _initialLocale() {
    var locale = preferences.getString(Constants.localeKey) ??
        Constants.englishLocaleKey;
    languageProvider.changeLocale(locale);
  }

  _initialUserData() {
    var token = preferences.getString(Constants.tokenKey) ?? "";
    appConfigProvider.token = token;
    return appConfigProvider.token.isEmpty;
  }
}
