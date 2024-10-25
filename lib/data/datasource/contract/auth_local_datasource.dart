import 'package:online_exam_app/domain/entities/user/user.dart';

abstract class AuthLocalDatasource {
  Future<void> storeToken(String token);
  Future<void> storeUser(User? user);

  Future<void> deleteToken(String token);
}
