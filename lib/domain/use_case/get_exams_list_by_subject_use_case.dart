import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';
import 'package:online_exam_app/domain/repository/exams_repository.dart';

@injectable
class GetExamsListBySubjectUseCase {
  ExamsRepository repository;

  GetExamsListBySubjectUseCase(this.repository);

  Future<Results<(List<Exam?>?, PaginationInfo?)>> call(
      String token, String subjectId, int pageNumber) async {
    var response = await repository.getExams(token, subjectId, pageNumber);
    return response;
  }
}
