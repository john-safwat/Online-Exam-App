import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/change_password/change_password_request.dart';
import 'package:online_exam_app/domain/repository/auth_repository.dart';

@injectable
class ChangePasswordUseCase {
  AuthRepository authRepository;

  ChangePasswordUseCase(this.authRepository);

  Future<Results<String?>> call(
          String token, ChangePasswordRequest request) async =>
      await authRepository.changePassword(token, request);
}
