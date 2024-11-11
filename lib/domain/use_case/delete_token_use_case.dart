import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/repository/auth_repository.dart';

@injectable
class DeleteTokenUseCase {
  AuthRepository authRepository;

  DeleteTokenUseCase(this.authRepository);

  Future<void> call() async => await authRepository.deleteToken();
}
