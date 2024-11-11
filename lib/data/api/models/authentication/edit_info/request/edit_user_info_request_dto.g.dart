// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_user_info_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditUserInfoRequestDto _$EditUserInfoRequestDtoFromJson(
        Map<String, dynamic> json) =>
    EditUserInfoRequestDto(
      username: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$EditUserInfoRequestDtoToJson(
        EditUserInfoRequestDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
    };
