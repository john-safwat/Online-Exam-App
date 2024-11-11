import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/question.dart';
import 'package:online_exam_app/domain/repository/exams_repository.dart';

@injectable
class GetExamQuestionsUseCase {
  ExamsRepository repository;

  GetExamQuestionsUseCase(this.repository);

  Future<Results<List<Question?>?>> call(String token, String examId) async =>
      repository.getExamQuestions(token, examId);
}
