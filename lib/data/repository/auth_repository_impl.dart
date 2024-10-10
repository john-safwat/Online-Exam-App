import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/datasource/contract/auth_remote_datasource.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/registration/registration_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_user.dart';
import 'package:online_exam_app/domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  const AuthRepositoryImpl(this._remoteDatasource);

  @override
  Future<Results<RegistrationResponse>> signup(RegistrationUser user)async{
    var response = await _remoteDatasource.signup(user.toDatasource());
    return response;
  }
}