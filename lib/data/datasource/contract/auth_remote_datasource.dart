import 'package:online_exam_app/data/models/registration/request/registration_user_dto.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/registration/registration_response.dart';

abstract class AuthRemoteDatasource {
  Future<Results<RegistrationResponse>> signup(RegistrationUserDto user);
}