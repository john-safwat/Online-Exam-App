import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/edit_user_info_request/edit_user_info_request.dart';
import 'package:online_exam_app/domain/entities/user/user.dart';
import 'package:online_exam_app/domain/repository/auth_repository.dart';

@injectable
class UpdateUserInfoUseCase {
  AuthRepository repository;

  UpdateUserInfoUseCase(this.repository);

  Future<Results<User?>> call(
          String token, EditUserInfoRequest request) async =>
      await repository.updateUserInfo(token, request);
}
