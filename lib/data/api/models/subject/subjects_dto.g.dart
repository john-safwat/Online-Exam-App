// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsDto _$SubjectsDtoFromJson(Map<String, dynamic> json) => SubjectsDto(
      subjectId: json['_id'] as String?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$SubjectsDtoToJson(SubjectsDto instance) =>
    <String, dynamic>{
      '_id': instance.subjectId,
      'name': instance.name,
      'icon': instance.icon,
      'createdAt': instance.createdAt,
    };
