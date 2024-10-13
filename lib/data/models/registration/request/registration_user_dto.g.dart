// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationUserDto _$RegistrationUserDtoFromJson(Map<String, dynamic> json) =>
    RegistrationUserDto(
      json['username'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['email'] as String?,
      json['password'] as String?,
      json['rePassword'] as String?,
      json['phone'] as String?,
    );

Map<String, dynamic> _$RegistrationUserDtoToJson(
        RegistrationUserDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'rePassword': instance.rePassword,
      'phone': instance.phone,
    };
