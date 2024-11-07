import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/constants.dart';
import 'package:online_exam_app/data/core/api_execution.dart';
import 'package:online_exam_app/data/datasource/contract/subjects_local_datasource.dart';
import 'package:online_exam_app/data/local_database/models/subjects/local_subjects_dto.dart';
import 'package:online_exam_app/data/local_database/subjects/subjects_local_database.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: SubjectsLocalDatasource)
class SubjectsLocalDatasourceImpl implements SubjectsLocalDatasource {
  final SubjectsLocalDatabase _localDatabase;
  final SharedPreferences _sharedPreferences;
  final ApiExecution _apiExecution;

  SubjectsLocalDatasourceImpl(
      this._localDatabase, this._apiExecution, this._sharedPreferences);

  @override
  Future<Results<bool>> addListOfSubjects(List<Subject?> subjects) async {
    var response = await _apiExecution.execute(() async {
      var response = await _localDatabase.addListOfSubjects(subjects
          .map(
            (e) => LocalSubjectsDto.fromDomain(e!),
          )
          .toList());
      return response;
    });
    return response;
  }

  @override
  Future<Results<void>> deleteAllSubjects() async {
    var response = await _apiExecution.execute(() async {
      var response = await _localDatabase.deleteAllSubjects();
      return response;
    });
    return response;
  }

  @override
  Future<Results<bool>> checkOnCacheValidation() async {
    var response = await _apiExecution.execute(() async {
      DateTime nowDate = DateTime.now();
      int? getDateTime = _sharedPreferences.getInt(Constants.validTimeKey);
      DateTime validDate =
          DateTime.fromMillisecondsSinceEpoch(getDateTime ?? 0);
      int difference = nowDate.difference(validDate).inDays;
      return difference <= 3;
    });
    return response;
  }

  @override
  Future<Results<bool>> updateCacheValidation() async {
    var response = await _apiExecution.execute(() async {
      var response = await _sharedPreferences.setInt(
          Constants.validTimeKey, DateTime.now().millisecondsSinceEpoch);
      return response;
    });
    return response;
  }

  @override
  Future<Results<List<Subject?>>> getAllSubjects() async {
    var response = await _apiExecution.execute(() async {
      var response = await _localDatabase.getAllSubjects();
      return response
          .map(
            (e) => e.toDomain(),
          )
          .toList();
    });
    return response;
  }
}
