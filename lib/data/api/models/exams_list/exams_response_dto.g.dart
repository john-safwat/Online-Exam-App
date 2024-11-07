// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exams_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamsResponseDto _$ExamsResponseDtoFromJson(Map<String, dynamic> json) =>
    ExamsResponseDto(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => ExamsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamsResponseDtoToJson(ExamsResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'exams': instance.exams,
    };
