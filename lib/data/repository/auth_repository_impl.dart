import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/datasource/contract/auth_remote_datasource.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_request.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_response.dart';
import 'package:online_exam_app/domain/entities/forgetPassword/forget_password_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_user.dart';
import 'package:online_exam_app/domain/entities/reset_password/reset_password_request.dart';
import 'package:online_exam_app/domain/entities/reset_password/reset_password_response.dart';
import 'package:online_exam_app/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import 'package:online_exam_app/domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;

  const AuthRepositoryImpl(this._remoteDatasource);

  @override
  Future<Results<RegistrationResponse>> signup(RegistrationUser user) async {
    var response = await _remoteDatasource.signup(user);
    return response;
  }

  @override
  Future<Results<AuthenticationResponse>> signIn(
      AuthenticationRequest auth) async {
    var response = await _remoteDatasource.signIn(auth);
    return response;
  }

  @override
  Future<Results<ForgetPasswordResponse>> forgetPassword(String email) async {
    var response = await _remoteDatasource.forgetPassword(email);
    return response;
  }

  @override
  Future<Results<VerifyResetCodeResponse>> verifyResetCode(
      String resetCode) async {
    var response = await _remoteDatasource.verifyResetCode(resetCode);
    return response;
  }

  @override
  Future<Results<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest request) async {
    var response = await _remoteDatasource.resetPassword(request);
    return response;
  }
}
