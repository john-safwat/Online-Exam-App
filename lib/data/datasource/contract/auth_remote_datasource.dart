import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_request.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_response.dart';
import 'package:online_exam_app/domain/entities/authentication/forgetPassword/forget_password_request.dart';
import 'package:online_exam_app/domain/entities/authentication/forgetPassword/forget_password_response.dart';
import 'package:online_exam_app/domain/entities/authentication/verify_reset_code/verify_reset_code_request.dart';
import 'package:online_exam_app/domain/entities/authentication/verify_reset_code/verify_reset_code_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_user.dart';

abstract class AuthRemoteDatasource {
  Future<Results<RegistrationResponse>> signup(RegistrationUser user);

  Future<Results<AuthenticationResponse>> signIn(AuthenticationRequest auth);

  Future<Results<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest forgetPassword);

  Future<Results<VerifyResetCodeResponse>> verifyResetCode(
      VerifyResetCodeRequest verify);
}
