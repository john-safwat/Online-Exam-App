
import 'package:online_exam_app/data/api/models/authentication/edit_info/request/edit_user_info_request_dto.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_request.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_response.dart';
import 'package:online_exam_app/domain/entities/change_password/change_password_request.dart';
import 'package:online_exam_app/domain/entities/edit_user_info_request/edit_user_info_request.dart';
import 'package:online_exam_app/domain/entities/forgetPassword/forget_password_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_user.dart';
import 'package:online_exam_app/domain/entities/reset_password/reset_password_request.dart';
import 'package:online_exam_app/domain/entities/reset_password/reset_password_response.dart';
import 'package:online_exam_app/domain/entities/user/user.dart';
import 'package:online_exam_app/domain/entities/verify_reset_code/verify_reset_code_response.dart';

abstract class AuthRemoteDatasource {
  Future<Results<RegistrationResponse>> signup(RegistrationUser user);

  Future<Results<AuthenticationResponse>> signIn(AuthenticationRequest auth);

  Future<Results<ForgetPasswordResponse>> forgetPassword(String email);

  Future<Results<VerifyResetCodeResponse>> verifyResetCode(String resetCode);

  Future<Results<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest request);

  Future<Results<User?>> getUserInfo(String token);
  Future<Results<User?>> updateUserInfo(String token , EditUserInfoRequest request);
  Future<Results<String?>> changePassword(String token , ChangePasswordRequest request);
}
