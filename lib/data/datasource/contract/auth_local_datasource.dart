abstract class AuthLocalDatasource {
  Future<void> storeToken(String token);

  Future<void> deleteToken(String token);
}
