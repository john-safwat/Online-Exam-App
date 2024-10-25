import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/constants.dart';
import 'package:online_exam_app/data/datasource/contract/auth_local_datasource.dart';
import 'package:online_exam_app/data/local_database/models/user/local_user.dart';
import 'package:online_exam_app/data/local_database/users/users_local_database.dart';
import 'package:online_exam_app/domain/entities/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  SharedPreferences sharedPreferences;
  UsersLocalDatabase usersLocalDatabase;

  AuthLocalDatasourceImpl(this.sharedPreferences, this.usersLocalDatabase);

  @override
  Future<void> storeToken(String token) async {
    await sharedPreferences.setString(Constants.tokenKey, token);
  }

  @override
  Future<void> deleteToken(String token) async {
    await sharedPreferences.remove(Constants.tokenKey);
  }

  @override
  Future<void> storeUser(User? user) async {
    if (user != null) {
      await usersLocalDatabase.addUser(LocalUser.fromDomain(user));
    }
  }
}
