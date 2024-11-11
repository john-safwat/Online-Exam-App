import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/datasource/contract/exams_local_datasouce.dart';
import 'package:online_exam_app/data/datasource/contract/exams_remote_datasource.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/exam/question.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';
import 'package:online_exam_app/domain/repository/exams_repository.dart';

@Injectable(as: ExamsRepository)
class ExamsRepositoryImpl implements ExamsRepository {
  final ExamsRemoteDatasource _remoteDatasource;
  final ExamsLocalDatasource _localDatasource;

  ExamsRepositoryImpl(this._remoteDatasource, this._localDatasource);

  @override
  Future<Results<(List<Exam?>?, PaginationInfo?)>> getExams(
      String token, String subjectId, int pageNumber) async {
    var response =
        await _remoteDatasource.getExams(token, subjectId, pageNumber);
    return response;
  }

  @override
  Future<Results<List<Question?>?>> getExamQuestions(
          String token, String examId) async =>
      await _remoteDatasource.getExamQuestions(token, examId);

  @override
  Future<Results<void>> addExam(Exam exam, List<Question?> questions) async {
    var response = await _localDatasource.addExam(exam, questions);
    return response;
  }

  @override
  Future<Results<List<Exam>>> getExamsList() async {
    var response = await _localDatasource.getExamsList();
    return response;
  }
}
