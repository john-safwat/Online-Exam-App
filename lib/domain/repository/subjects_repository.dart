import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';

abstract class SubjectsRepository {
  Future<Results<(List<Subject?>?, PaginationInfo?)>> getSubjects(String token);
}
