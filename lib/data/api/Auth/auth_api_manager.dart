import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/Auth/auth_retrofit_clint.dart';

import '../../models/registration/request/registration_user_dto.dart';
import '../../models/registration/response/registration_response_dto.dart';

@injectable
@singleton
class AuthApiManager {
  final AuthRetrofitClint _clint;

  const AuthApiManager(this._clint);

  Future<RegistrationResponseDto> signup(RegistrationUserDto user) async {
    print(user.toJson().toString());
    var response = await _clint.signup(user);
    return response;
  }
}
