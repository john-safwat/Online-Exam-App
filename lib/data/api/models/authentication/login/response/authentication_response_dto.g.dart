// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationResponseDto _$AuthenticationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponseDto(
      message: json['message'] as String?,
      token: json['token'] as String?,
      code: json['code'] as num?,
    )..user = json['user'] == null
        ? null
        : UserDto.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$AuthenticationResponseDtoToJson(
        AuthenticationResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'code': instance.code,
      'user': instance.user,
    };
