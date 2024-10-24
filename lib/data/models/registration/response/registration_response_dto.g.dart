// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationResponseDto _$RegistrationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RegistrationResponseDto(
      message: json['message'] as String?,
      token: json['token'] as String?,
      code: json['code'] as num?,
    );

Map<String, dynamic> _$RegistrationResponseDtoToJson(
        RegistrationResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'code': instance.code,
    };
