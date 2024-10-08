import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LanguageProvider extends ChangeNotifier{

  // set the default local
  String _currentLocal = Constants.englishLocalKey;

  // function to change the local with new local and set it in
  Future<void> changeLocal(String newLocal)async{

    // if the new local is the same this condition will terminate
    if(newLocal == _currentLocal) {return;}

    // reed the shared preferences to read the old value of the theme
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentLocal = newLocal;
    prefs.setString(Constants.localKey, _currentLocal);

    // notify all listeners on the theme values
    notifyListeners();
  }

  // if the language is english
  bool isEn(){
    return _currentLocal == Constants.englishLocalKey;
  }

  // function to return the local
  String getLocal(){
    return _currentLocal;
  }

}