// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsResponseDto _$SubjectsResponseDtoFromJson(Map<String, dynamic> json) =>
    SubjectsResponseDto(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => SubjectsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectsResponseDtoToJson(
        SubjectsResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'subjects': instance.subjects,
    };
