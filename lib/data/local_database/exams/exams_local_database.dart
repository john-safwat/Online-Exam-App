import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:online_exam_app/data/local_database/models/exam/local_exam_dto.dart';

@singleton
class ExamsLocalDatabase {

  Isar isar;
  ExamsLocalDatabase(this.isar);

  Future<void> addExam(LocalExamDto exam) async {
    await isar.writeTxn(() async {
      await isar.localExamDtos.put(exam);
    });
  }

}