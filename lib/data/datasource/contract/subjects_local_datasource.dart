import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';

abstract class SubjectsLocalDatasource {
  Future<Results<bool>> addListOfSubjects(List<Subject?> subjects);

  Future<Results<void>> deleteAllSubjects();

  Future<Results<List<Subject?>>> getAllSubjects();

  Future<Results<bool>> updateCacheValidation();

  Future<Results<bool>> checkOnCacheValidation();
}
