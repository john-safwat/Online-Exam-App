import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/domain/entities/user/user.dart';

part 'user_info_response_dto.g.dart';

@JsonSerializable()
class UserInfoResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? user;

  UserInfoResponseDto ({
    this.message,
    this.user,
  });

  factory UserInfoResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UserInfoResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserInfoResponseDtoToJson(this);
  }
}

@JsonSerializable()
class UserDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "passwordResetCode")
  final String? passwordResetCode;
  @JsonKey(name: "passwordResetExpires")
  final String? passwordResetExpires;
  @JsonKey(name: "resetCodeVerified")
  final bool? resetCodeVerified;

  UserDto ({
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

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }

  User toDomain(){
    return User(
        id : id,
        username : username,
        firstName : firstName,
        lastName : lastName,
        email : email,
        phone : phone,
        role : role,
        isVerified : isVerified,
        createdAt : createdAt,
        passwordResetCode : passwordResetCode,
        passwordResetExpires : passwordResetExpires,
        resetCodeVerified : resetCodeVerified,

    );
  }
}


