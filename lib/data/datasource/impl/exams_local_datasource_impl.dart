import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/core/api_execution.dart';
import 'package:online_exam_app/data/datasource/contract/exams_local_datasouce.dart';
import 'package:online_exam_app/data/local_database/exams/exams_local_database.dart';
import 'package:online_exam_app/data/local_database/models/exam/local_exam_dto.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/exam/question.dart';

@Injectable(as:  ExamsLocalDatasource)
class ExamsLocalDatasourceImpl implements ExamsLocalDatasource{

  final ExamsLocalDatabase _database;
  final ApiExecution _apiExecution;
  ExamsLocalDatasourceImpl(this._database , this._apiExecution);

  @override
  Future<Results<void>> addExam(Exam exam, List<Question?> questions) async {
    var response = await _apiExecution.execute(()async{
      var response = await _database.addExam(LocalExamDto.fromDomain(exam, questions));
      return response;
    });
    return response;
  }

}