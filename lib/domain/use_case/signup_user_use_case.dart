import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/registration/registration_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_user.dart';
import 'package:online_exam_app/domain/repository/auth_repository.dart';

@injectable
class SignupUserUseCase {
  final AuthRepository _repository;

  const SignupUserUseCase(this._repository);

  Future<Results<RegistrationResponse>> call(RegistrationUser user) async {
    var response = await _repository.signup(user);
    return response;
  }
}
