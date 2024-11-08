import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/exam/question.dart';
import 'package:online_exam_app/domain/repository/exams_repository.dart';

@injectable
class SubmitExamUseCase {
  final ExamsRepository _repository;

  SubmitExamUseCase(this._repository);

  Future<Results<void>> call(Exam exam, List<Question?> questions) async =>
      await _repository.addExam(exam, questions);
}
