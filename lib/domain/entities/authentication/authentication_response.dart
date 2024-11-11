import 'package:online_exam_app/domain/entities/user/user.dart';

class AuthenticationResponse {
  final String? message;
  final String? token;
  final num? code;
  final User? user;

  AuthenticationResponse({this.message, this.token, this.code, this.user});
}
