import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api_constants.dart';
import 'package:online_exam_app/data/models/registration/request/registration_user_dto.dart';
import 'package:online_exam_app/data/models/registration/response/registration_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_retrofit_clint.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthRetrofitClint {
  @factoryMethod
  factory AuthRetrofitClint(Dio dio) = _AuthRetrofitClint;

  @POST(ApiConstants.signupRoute)
  Future<RegistrationResponseDto> signup(@Body() RegistrationUserDto user);
}
