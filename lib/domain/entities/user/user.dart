

class User {

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

  User ({
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
  });

}
