// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoResponseDto _$UserInfoResponseDtoFromJson(Map<String, dynamic> json) =>
    UserInfoResponseDto(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoResponseDtoToJson(
        UserInfoResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      isVerified: json['isVerified'] as bool?,
      createdAt: json['createdAt'] as String?,
      passwordResetCode: json['passwordResetCode'] as String?,
      passwordResetExpires: json['passwordResetExpires'] as String?,
      resetCodeVerified: json['resetCodeVerified'] as bool?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'isVerified': instance.isVerified,
      'createdAt': instance.createdAt,
      'passwordResetCode': instance.passwordResetCode,
      'passwordResetExpires': instance.passwordResetExpires,
      'resetCodeVerified': instance.resetCodeVerified,
    };
