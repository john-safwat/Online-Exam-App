import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';

part 'metadata_dto.g.dart';

@JsonSerializable()
class MetadataDto {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;

  MetadataDto({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory MetadataDto.fromJson(Map<String, dynamic> json) {
    return _$MetadataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataDtoToJson(this);
  }

  PaginationInfo toDomain() {
    return PaginationInfo(
      currentPage: currentPage,
      numberOfPages: numberOfPages,
      limit: limit,
    );
  }
}
