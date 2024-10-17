// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponseDto _$ForgetPasswordResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponseDto(
      message: json['message'] as String?,
      info: json['info'] as String?,
      code: json['code'] as num?,
    );

Map<String, dynamic> _$ForgetPasswordResponseDtoToJson(
        ForgetPasswordResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'info': instance.info,
      'code': instance.code,
    };
