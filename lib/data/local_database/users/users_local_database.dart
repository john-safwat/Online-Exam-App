import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:online_exam_app/data/local_database/models/user/local_user.dart';

@singleton
class UsersLocalDatabase {
  Isar isar;

  UsersLocalDatabase(this.isar);

  Future<void> addUser(LocalUser user) async {
    await isar.writeTxn(() async {
      await isar.localUsers.put(user);
    });
  }

  Future<LocalUser?> getUser(String token) async {
    var response = await isar.writeTxn(() async {
      var response =
          await isar.localUsers.filter().tokenEqualTo(token).findFirst();
      return response;
    });
    return response;
  }
}
