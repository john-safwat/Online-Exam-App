import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/authentication/forgetPassword/forget_password_request.dart';
import 'package:online_exam_app/domain/entities/authentication/forgetPassword/forget_password_response.dart';
import 'package:online_exam_app/domain/repository/auth_repository.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepository _repository;

  const ForgetPasswordUseCase(this._repository);

  Future<Results<ForgetPasswordResponse>> call(
      ForgetPasswordRequest request) async {
    var response = await _repository.forgetPassword(request);
    return response;
  }
}