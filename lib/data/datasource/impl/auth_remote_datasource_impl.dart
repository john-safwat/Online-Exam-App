import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/auth/auth_retrofit_client.dart';
import 'package:online_exam_app/data/core/api_execution.dart';
import 'package:online_exam_app/data/datasource/contract/auth_remote_datasource.dart';
import 'package:online_exam_app/data/models/authentication/forget_password/request/forget_password_request_dto.dart';
import 'package:online_exam_app/data/models/authentication/login/request/authentication_request_dto.dart';
import 'package:online_exam_app/data/models/authentication/reset_password/request/reset_password_request_dto.dart';
import 'package:online_exam_app/data/models/authentication/verify_reset_code/request/verify_reset_code_request_dto.dart';
import 'package:online_exam_app/data/models/registration/request/registration_user_dto.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_request.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_response.dart';
import 'package:online_exam_app/domain/entities/forgetPassword/forget_password_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_user.dart';
import 'package:online_exam_app/domain/entities/reset_password/reset_password_request.dart';
import 'package:online_exam_app/domain/entities/reset_password/reset_password_response.dart';
import 'package:online_exam_app/domain/entities/user/user.dart';
import 'package:online_exam_app/domain/entities/verify_reset_code/verify_reset_code_response.dart';

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final AuthRetrofitClient _authRetrofitClient;
  final ApiExecution _apiExecution;

  const AuthRemoteDatasourceImpl(this._authRetrofitClient, this._apiExecution);

  @override
  Future<Results<RegistrationResponse>> signup(RegistrationUser user) async {
    var response = await _apiExecution.execute<RegistrationResponse>(() async {
      var response = await _authRetrofitClient
          .signup(RegistrationUserDto.fromDomain(user));
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<AuthenticationResponse>> signIn(
      AuthenticationRequest auth) async {
    var response =
        await _apiExecution.execute<AuthenticationResponse>(() async {
      var response = await _authRetrofitClient
          .signIn(AuthenticationRequestDto.fromDomain(auth));
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<ForgetPasswordResponse>> forgetPassword(String email) async {
    var response =
        await _apiExecution.execute<ForgetPasswordResponse>(() async {
      var response = await _authRetrofitClient
          .forgetPassword(ForgetPasswordRequestDto(email: email));
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<VerifyResetCodeResponse>> verifyResetCode(
      String resetCode) async {
    var response =
        await _apiExecution.execute<VerifyResetCodeResponse>(() async {
      var response = await _authRetrofitClient
          .verifyResetCode(VerifyResetCodeRequestDto(resetCode: resetCode));
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest request) async {
    var response = await _apiExecution.execute<ResetPasswordResponse>(() async {
      var response = await _authRetrofitClient.resetPassword(
          ResetPasswordRequestDto(
              email: request.email, newPassword: request.newPassword));
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<User?>> getUserInfo(String token) async {
    var response = await _apiExecution.execute<User?>(() async {
      var response = await _authRetrofitClient.getUserInfo(token);
      return response.user?.toDomain();
    });
    return response;
  }
}
