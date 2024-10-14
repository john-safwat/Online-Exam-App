import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/Auth/auth_retrofit_client.dart';
import 'package:online_exam_app/data/core/api_execution.dart';
import 'package:online_exam_app/data/datasource/contract/auth_remote_datasource.dart';
import 'package:online_exam_app/data/models/authentication/forget_password/request/forget_password_request_dto.dart';
import 'package:online_exam_app/data/models/authentication/login/request/authentication_request_dto.dart';
import 'package:online_exam_app/data/models/registration/request/registration_user_dto.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_request.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_response.dart';
import 'package:online_exam_app/domain/entities/authentication/forgetPassword/forget_password_request.dart';
import 'package:online_exam_app/domain/entities/authentication/forgetPassword/forget_password_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_user.dart';

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiExecution _apiExecution;

  final AuthRetrofitClient _authRetrofitClint;

  const AuthRemoteDatasourceImpl(this._authRetrofitClint, this._apiExecution);

  @override
  Future<Results<RegistrationResponse>> signup(RegistrationUser user) async {
    var response = await _apiExecution.execute<RegistrationResponse>(() async {
      var response = await _authRetrofitClint.signup(RegistrationUserDto.fromDomain(user));
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<AuthenticationResponse>> signIn(AuthenticationRequest auth) async{
    var response = await _apiExecution.execute<AuthenticationResponse>(()async{
      var response = await _authRetrofitClint.signIn(AuthenticationRequestDto.fromDomain(auth));
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<ForgetPasswordResponse>> forgetPassword(ForgetPasswordRequest forgetPassword) async{
    var response = await _apiExecution.execute<ForgetPasswordResponse>(()async{
      var response = await _authRetrofitClint.forgetPassword(ForgetPasswordRequestDto(email: forgetPassword.email));
      return response.toDomain();
    });
    return response;
  }


}
