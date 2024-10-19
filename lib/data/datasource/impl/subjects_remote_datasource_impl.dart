import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/subjects/subjects_retrofit_client.dart';
import 'package:online_exam_app/data/core/api_execution.dart';
import 'package:online_exam_app/data/datasource/contract/subjects_remote_datasource.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';

@Injectable(as: SubjectsRemoteDatasource)
class SubjectsRemoteDatasourceImpl implements SubjectsRemoteDatasource {
  final SubjectsRetrofitClient _retrofitClient;
  final ApiExecution _apiExecution;

  SubjectsRemoteDatasourceImpl(this._retrofitClient, this._apiExecution);

  @override
  Future<Results<(List<Subject?>?, PaginationInfo?)>> getSubjects(
      String token) async {
    var response =
        await _apiExecution.execute<(List<Subject?>?, PaginationInfo?)>(
      () async {
        var response = await _retrofitClient.getSubjects(token);
        var subjects = response.subjects
            ?.map(
              (e) => e.toDomain(),
            )
            .toList();

        return (subjects, response.metadata?.toDomain());
      },
    );
    return response;
  }
}
