import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import 'package:online_exam_app/domain/repository/auth_repository.dart';

@injectable
class VerifyResetPasswordUseCase {
  final AuthRepository _authRepository;

  const VerifyResetPasswordUseCase(this._authRepository);

  Future<Results<VerifyResetCodeResponse>> call(
          {required String resetCode}) async =>
      await _authRepository.verifyResetCode(resetCode);
}
