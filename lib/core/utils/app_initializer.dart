import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/constants.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/providers/language_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
@injectable
class AppInitializer {
  LanguageProvider provider ;
  AppInitializer(this.provider);
  Future<void> initialLocale() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var locale =
        preferences.getString(Constants.localeKey) ?? Constants.englishLocaleKey;
    provider.changeLocale(locale);
  }
}
