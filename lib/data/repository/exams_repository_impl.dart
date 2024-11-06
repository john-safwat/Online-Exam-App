import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/datasource/contract/exams_remote_datasource.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';
import 'package:online_exam_app/domain/repository/exams_repository.dart';

@Injectable(as: ExamsRepository)
class ExamsRepositoryImpl implements ExamsRepository {
  final ExamsRemoteDatasource _remoteDatasource;

  ExamsRepositoryImpl(this._remoteDatasource);

  @override
  Future<Results<(List<Exam?>?, PaginationInfo?)>> getExams(
      String token, String subjectId, int pageNumber) async {
    var response =
        await _remoteDatasource.getExams(token, subjectId, pageNumber);
    return response;
  }
}
