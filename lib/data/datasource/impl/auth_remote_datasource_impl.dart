import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/Auth/auth_api_manager.dart';
import 'package:online_exam_app/data/core/api_execution.dart';
import 'package:online_exam_app/data/datasource/contract/auth_remote_datasource.dart';
import 'package:online_exam_app/data/models/registration/request/registration_user_dto.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/registration/registration_response.dart';

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final AuthApiManager _apiManager;
  final ApiExecution _apiExecution ;
  const AuthRemoteDatasourceImpl(this._apiManager , this._apiExecution);

  @override
  Future<Results<RegistrationResponse>> signup(RegistrationUserDto user) async {
    var response = await _apiExecution.execute<RegistrationResponse>(()async{
      var response = await _apiManager.signup(user);
      return response.toDomain();
    });
    return response;
  }
}
