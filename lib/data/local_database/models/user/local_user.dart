import 'package:isar/isar.dart';
import 'package:online_exam_app/domain/entities/user/user.dart';

part 'local_user.g.dart';

@collection
class LocalUser {
  Id? userId = Isar.autoIncrement;
  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final String? createdAt;
  final String? passwordResetCode;
  final String? passwordResetExpires;
  final bool? resetCodeVerified;
  final String? token;

  LocalUser({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
    this.token
  });

  factory LocalUser.fromDomain(User user) {
    return LocalUser(
      id: user.id,
      username: user.username,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      phone: user.phone,
      role: user.role,
      isVerified: user.isVerified,
      createdAt: user.createdAt,
      passwordResetCode: user.passwordResetCode,
      passwordResetExpires: user.passwordResetExpires,
      resetCodeVerified: user.resetCodeVerified,
      token: user.token
    );
  }

  User toDomain() {
    return User(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      isVerified: isVerified,
      createdAt: createdAt,
      passwordResetCode: passwordResetCode,
      passwordResetExpires: passwordResetExpires,
      resetCodeVerified: resetCodeVerified,
      token: token
    );
  }
}
