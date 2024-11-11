// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chaneg_password_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordResponseDto _$ChangePasswordResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordResponseDto(
      message: json['message'] as String?,
      token: json['token'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChangePasswordResponseDtoToJson(
        ChangePasswordResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'code': instance.code,
    };
