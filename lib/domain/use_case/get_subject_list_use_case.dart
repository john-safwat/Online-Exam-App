import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';
import 'package:online_exam_app/domain/repository/subjects_repository.dart';

@injectable
class GetSubjectListUseCase {
  SubjectsRepository repository;

  GetSubjectListUseCase(this.repository);

  Future<Results<(List<Subject?>?, PaginationInfo?)>> call(
          String token) async =>
      await repository.getSubjects(token);
}
