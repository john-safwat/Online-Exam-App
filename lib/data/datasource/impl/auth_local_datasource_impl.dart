import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/constants.dart';
import 'package:online_exam_app/data/datasource/contract/auth_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  SharedPreferences sharedPreferences;

  AuthLocalDatasourceImpl(this.sharedPreferences);

  @override
  Future<void> storeToken(String token) async {
    await sharedPreferences.setString(Constants.tokenKey, token);
  }

  @override
  Future<void> deleteToken(String token) async {
    await sharedPreferences.remove(Constants.tokenKey);
  }
}
