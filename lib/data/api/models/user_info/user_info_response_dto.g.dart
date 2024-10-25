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
