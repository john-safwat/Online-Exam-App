import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:online_exam_app/data/local_database/models/subjects/local_subjects_dto.dart';

@singleton
class SubjectsLocalDatabase {
  Isar isar;

  SubjectsLocalDatabase(this.isar);

  Future<bool> addListOfSubjects(List<LocalSubjectsDto> subjects) async {
    var response = await isar.writeTxn(() async {
      var response = isar.localSubjectsDtos.putAll(subjects);
      return response;
    });
    return response.isEmpty;
  }

  Future<List<LocalSubjectsDto>> getAllSubjects() async {
    var response = await isar.writeTxn(() async {
      var response = isar.localSubjectsDtos.where().findAll();
      return response;
    });
    return response;
  }

  Future<void> deleteAllSubjects() async {
    await isar.writeTxn(() async {
      await isar.localSubjectsDtos.clear();
    });
  }

}
