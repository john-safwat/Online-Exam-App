import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api_constants.dart';
import 'package:online_exam_app/data/api/models/authentication/change_password/request/change_password_request_dto.dart';
import 'package:online_exam_app/data/api/models/authentication/change_password/response/chaneg_password_response_dto.dart';
import 'package:online_exam_app/data/api/models/authentication/edit_info/request/edit_user_info_request_dto.dart';
import 'package:online_exam_app/data/api/models/authentication/forget_password/request/forget_password_request_dto.dart';
import 'package:online_exam_app/data/api/models/authentication/forget_password/response/forget_password_response_dto.dart';
import 'package:online_exam_app/data/api/models/authentication/login/request/authentication_request_dto.dart';
import 'package:online_exam_app/data/api/models/authentication/login/response/authentication_response_dto.dart';
import 'package:online_exam_app/data/api/models/authentication/registration/request/registration_user_dto.dart';
import 'package:online_exam_app/data/api/models/authentication/registration/response/registration_response_dto.dart';
import 'package:online_exam_app/data/api/models/authentication/reset_password/request/reset_password_request_dto.dart';
import 'package:online_exam_app/data/api/models/authentication/reset_password/response/reset_password_response_dto.dart';
import 'package:online_exam_app/data/api/models/authentication/verify_reset_code/request/verify_reset_code_request_dto.dart';
import 'package:online_exam_app/data/api/models/authentication/verify_reset_code/response/verify_reset_code_response_dto.dart';
import 'package:online_exam_app/data/api/models/user_info/user_info_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthRetrofitClient {
  @factoryMethod
  factory AuthRetrofitClient(Dio dio) = _AuthRetrofitClient;

  @POST(ApiConstants.signupRoute)
  Future<RegistrationResponseDto> signup(@Body() RegistrationUserDto user);

  @POST(ApiConstants.loginRoute)
  Future<AuthenticationResponseDto> signIn(
      @Body() AuthenticationRequestDto authentication);

  @POST(ApiConstants.forgetPasswordRoute)
  Future<ForgetPasswordResponseDto> forgetPassword(
      @Body() ForgetPasswordRequestDto request);

  @POST(ApiConstants.verifyResetCode)
  Future<VerifyResetCodeResponseDto> verifyResetCode(
      @Body() VerifyResetCodeRequestDto resetCode);

  @PUT(ApiConstants.resetPasswordRoute)
  Future<ResetPasswordResponseDto> resetPassword(
      @Body() ResetPasswordRequestDto request);

  @GET(ApiConstants.profileDataRoute)
  Future<UserInfoResponseDto> getUserInfo(@Header("token") String token);

  @PUT(ApiConstants.editProfileRoute)
  Future<UserInfoResponseDto> updateUserInfo(@Header("token") String token,
      @Body() EditUserInfoRequestDto editUserInfoRequestDto);

  @PATCH(ApiConstants.changePasswordRoute)
  Future<ChangePasswordResponseDto> changePassword(
      @Header("token") String token, @Body() ChangePasswordRequestDto request);
}
