import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/exam/question.dart';

abstract class ExamsLocalDatasource {
  Future<Results<void>> addExam(Exam exam, List<Question?> questions);
}