import 'package:online_exam_app/core/constants/constants.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/providers/language_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInitializer {

  Future<void> initialLocal()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var local = preferences.getString(Constants.localKey)??Constants.englishLocalKey;
    getIt<LanguageProvider>().changeLocal(local);
  }

}