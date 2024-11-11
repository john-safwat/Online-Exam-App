import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/exam/question.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';

abstract class ExamsRepository {
  Future<Results<(List<Exam?>?, PaginationInfo?)>> getExams(
      String token, String subjectId, int pageNumber);

  Future<Results<List<Question?>?>> getExamQuestions(
      String token, String examId);
  Future<Results<void>> addExam(Exam exam, List<Question?> questions);
  Future<Results<List<Exam>>> getExamsList();

}
