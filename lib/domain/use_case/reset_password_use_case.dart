import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/reset_password/reset_password_request.dart';
import 'package:online_exam_app/domain/entities/reset_password/reset_password_response.dart';
import 'package:online_exam_app/domain/repository/auth_repository.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepository _authRepository;

  const ResetPasswordUseCase(this._authRepository);

  Future<Results<ResetPasswordResponse>> call(
          ResetPasswordRequest request) async =>
      await _authRepository.resetPassword(request);
}
