import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:online_exam_app/data/local_database/models/user/local_user_dto.dart';

@singleton
class UsersLocalDatabase {
  Isar isar;

  UsersLocalDatabase(this.isar);

  Future<void> addUser(LocalUserDto user) async {
    await isar.writeTxn(() async {
      await isar.localUserDtos.put(user);
    });
  }

  Future<LocalUserDto?> getUser(String token) async {
    var response = await isar.writeTxn(() async {
      var response =
          await isar.localUserDtos.filter().tokenEqualTo(token).findFirst();
      return response;
    });
    return response;
  }
}
