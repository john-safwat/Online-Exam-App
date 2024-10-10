import 'package:online_exam_app/data/models/registration/request/registration_user_dto.dart';

class RegistrationUser {
  RegistrationUser({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  RegistrationUserDto toDatasource() {
    return RegistrationUserDto(
      username!,
      firstName!,
      lastName!,
      email!,
      password!,
      rePassword!,
      phone!,
    );
  }
}
