import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/exams/exams_retrofit_client.dart';
import 'package:online_exam_app/data/core/api_execution.dart';
import 'package:online_exam_app/data/datasource/contract/exams_remote_datasource.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/exam/question.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';

@Injectable(as: ExamsRemoteDatasource)
class ExamsRemoteDatasourceImpl implements ExamsRemoteDatasource {
  final ExamsRetrofitClient _retrofitClient;
  final ApiExecution _apiExecution;

  ExamsRemoteDatasourceImpl(this._retrofitClient, this._apiExecution);

  @override
  Future<Results<(List<Exam?>?, PaginationInfo?)>> getExams(
      String token, String subjectId, int pageNumber) async {
    var response =
        await _apiExecution.execute<(List<Exam?>?, PaginationInfo?)>(() async {
      var response =
          await _retrofitClient.getExamsBySubject(token, subjectId, pageNumber);
      var examsList = response.exams
          ?.map(
            (e) => e.toDomain(),
          )
          .toList();
      return (examsList, response.metadata?.toDomain());
    });
    return response;
  }

  @override
  Future<Results<List<Question?>?>> getExamQuestions(
      String token, String examId) async {
    var response = await _apiExecution.execute(() async {
      var response = await _retrofitClient.getExamDetails(token, examId);
      return response.questions
          ?.map(
            (e) => e.toDomain(),
          )
          .toList();
    });
    return response;
  }
}
