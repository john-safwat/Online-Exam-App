import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/datasource/contract/subjects_remote_datasource.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';
import 'package:online_exam_app/domain/repository/subjects_repository.dart';

@Injectable(as: SubjectsRepository)
class SubjectsRepositoryImpl implements SubjectsRepository {
  final SubjectsRemoteDatasource _remoteDatasource;

  SubjectsRepositoryImpl(this._remoteDatasource);

  @override
  Future<Results<(List<Subject?>?, PaginationInfo?)>> getSubjects(
      String token) async {
    var response = await _remoteDatasource.getSubjects(token);
    return response;
  }
}
