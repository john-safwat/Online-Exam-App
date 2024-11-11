import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/repository/exams_repository.dart';

@injectable
class GetExamsResultsListUseCase {
  ExamsRepository repository;

  GetExamsResultsListUseCase(this.repository);

  Future<Results<List<Exam?>>> call() async {
    var response = await repository.getExamsList();
    if (response is Success<List<Exam>>) {
      return calculateCorrectAnswers(response.data!);
    } else {
      return response;
    }
  }

  Results<List<Exam>> calculateCorrectAnswers(List<Exam> exams) {
    for (var exam in exams) {
      int correct = 0;
      for (var question in exam.questions!) {
        if (question?.correct == question?.selectedAnswer?.key) {
          correct++;
        }
      }
      exam.correctAnswers = correct;
    }

    return Success(exams);
  }
}
