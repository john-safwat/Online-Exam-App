import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/constants.dart';
import 'package:online_exam_app/core/providers/app_config_provider.dart';
import 'package:online_exam_app/core/providers/language_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
@injectable
class AppInitializer {
  LanguageProvider languageProvider;
  AppConfigProvider appConfigProvider;
  late SharedPreferences preferences;

  AppInitializer(this.languageProvider, this.appConfigProvider);

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
    _initialLocale();
    _initialUserData();
  }

  _initialLocale() {
    var locale = preferences.getString(Constants.localeKey) ??
        Constants.englishLocaleKey;
    languageProvider.changeLocale(locale);
  }

  bool _initialUserData() {
    var token = preferences.getString(Constants.tokenKey) ?? "";
    appConfigProvider.token = token;
    return appConfigProvider.token.isEmpty;
  }
}
