import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/registration/registration_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_user.dart';

abstract class AuthRepository {
  Future<Results<RegistrationResponse>> signup(RegistrationUser user);
}