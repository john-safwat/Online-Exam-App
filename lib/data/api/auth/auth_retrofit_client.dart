import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api_constants.dart';
import 'package:online_exam_app/data/models/authentication/request/authentication_request_dto.dart';
import 'package:online_exam_app/data/models/authentication/response/authentication_response_dto.dart';
import 'package:online_exam_app/data/models/registration/request/registration_user_dto.dart';
import 'package:online_exam_app/data/models/registration/response/registration_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_retrofit_client.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthRetrofitClient {
  @factoryMethod
  factory AuthRetrofitClient(Dio dio) = _AuthRetrofitClient;

  @POST(ApiConstants.signupRoute)
  Future<RegistrationResponseDto> signup(@Body() RegistrationUserDto user);

  @POST(ApiConstants.loginRoute)
  Future<AuthenticationResponseDto> signIn(
      @Body() AuthenticationRequestDto authentication);
}
