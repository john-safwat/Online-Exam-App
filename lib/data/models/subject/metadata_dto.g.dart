// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetadataDto _$MetadataDtoFromJson(Map<String, dynamic> json) => MetadataDto(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetadataDtoToJson(MetadataDto instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };
