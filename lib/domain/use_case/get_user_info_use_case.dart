import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/user/user.dart';
import 'package:online_exam_app/domain/repository/auth_repository.dart';

@injectable
class GetUserInfoUseCase {
  AuthRepository repository;

  GetUserInfoUseCase(this.repository);

  Future<Results<User?>> call(String token) async =>
      await repository.getUserInfo(token);
}
