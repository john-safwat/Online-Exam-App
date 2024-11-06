import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';

abstract class ExamsRemoteDatasource {
  Future<Results<(List<Exam?>?, PaginationInfo?)>> getExams(
      String token, String subjectId, int pageNumber);
}
