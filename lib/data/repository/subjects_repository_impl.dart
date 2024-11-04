import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/datasource/contract/subjects_local_datasource.dart';
import 'package:online_exam_app/data/datasource/contract/subjects_remote_datasource.dart';
import 'package:online_exam_app/domain/core/app_exception.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';
import 'package:online_exam_app/domain/repository/subjects_repository.dart';

@Injectable(as: SubjectsRepository)
class SubjectsRepositoryImpl implements SubjectsRepository {
  final SubjectsRemoteDatasource _remoteDatasource;
  final SubjectsLocalDatasource _localDatasource;

  SubjectsRepositoryImpl(this._remoteDatasource, this._localDatasource);


  /// Retrieves a list of subjects and pagination info.
  ///
  /// - Parameters:
  ///   - [token]: Authorization token for API requests.
  ///   - [pageNumber]: Page number for paginated data.
  /// - Returns: A `Results` object containing a tuple of `List<Subject?>?` and `PaginationInfo?`.
  ///   - If the connection is available, it tries to fetch data from the remote source.
  ///     - On success, it updates the local cache.
  ///     - On failure, it falls back to the local cache if valid data is available.
  ///   - If offline, it directly fetches data from the local cache.
  @override
  Future<Results<(List<Subject?>?, PaginationInfo?)>> getSubjects(
      String token, int pageNumber) async {
    var internetConnected = await _checkConnection();
    if (internetConnected) {
      var response = await _remoteDatasource.getSubjects(token, pageNumber);
      switch (response) {
        case Success<(List<Subject?>?, PaginationInfo?)>():
          {
            await _updateLocalDatasource(response.data!, pageNumber);
            return response;
          }
        case Failure<(List<Subject?>?, PaginationInfo?)>():
          {
            if(response.exception is DioException){
              var exception = response.exception as DioException;
              if (exception.type == DioExceptionType.badResponse) {
                if (exception.response?.data["message"] ==
                    "invalid token .. login again") {
                  return response;
                }
              }
            }
            var localResponse = await _getDataFromLocalDatasource();
            if (localResponse is Success<List<Subject?>>) {
              return Success((localResponse.data, null));
            } else {
              return response;
            }
          }
      }
    } else {
      var localResponse = await _getDataFromLocalDatasource();
      switch (localResponse) {
        case Success<List<Subject?>>():
          {
            return Success((localResponse.data, null));
          }
        case Failure<List<Subject?>>():
          {
            return Failure<(List<Subject?>?, PaginationInfo?)>(
                localResponse.exception);
          }
      }
    }
  }

  /// Checks the current network connectivity.
  ///
  /// - Returns: `true` if there is a Wi-Fi or mobile connection; `false` otherwise.
  Future<bool> _checkConnection() async {
    try {
      var connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.wifi) ||
          connectionResult.contains(ConnectivityResult.mobile)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  /// Updates the local data source with a new list of subjects and manages cache.
  ///
  /// - Parameters:
  ///   - [data]: Tuple containing a list of `Subject` objects and `PaginationInfo`.
  ///   - [pageNumber]: Current page number in pagination.
  /// - Behavior: Deletes all cached subjects if fetching the first page, then
  ///   adds the new subjects to the cache. Finally, it updates the cache validation timestamp.
  Future<void> _updateLocalDatasource(
      (List<Subject?>?, PaginationInfo?) data, int pageNumber) async {
    if (pageNumber == 1) {
      await _localDatasource.deleteAllSubjects();
      await _localDatasource.addListOfSubjects(data.$1!);
    } else {
      await _localDatasource.addListOfSubjects(data.$1!);
    }
    await _localDatasource.updateCacheValidation();
  }

  /// Retrieves cached subjects data from the local data source if the cache is valid.
  ///
  /// - Returns: A `Results` object containing a list of `Subject` entities.
  ///   - If the cache validation check passes, it retrieves all subjects from the cache.
  ///   - If the cache is invalid, returns a `Failure` result with an appropriate error.
  Future<Results<List<Subject?>>> _getDataFromLocalDatasource() async {
    var response = await _localDatasource.checkOnCacheValidation();
    if (response is Success<bool>) {
      var data = await _localDatasource.getAllSubjects();
      return data;
    } else {
      return Failure<List<Subject?>>(ServerError("Something went wrong", 404));
    }
  }
}
