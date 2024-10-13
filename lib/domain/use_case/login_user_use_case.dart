import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_request.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_response.dart';
import 'package:online_exam_app/domain/repository/auth_repository.dart';

@injectable
class LoginUserUseCase {
  final AuthRepository _authRepository;

  const LoginUserUseCase(this._authRepository);

  Future<Results<AuthenticationResponse>> call(AuthenticationRequest auth) async {
    var response = await _authRepository.signIn(auth);
    return response;
  }
}
