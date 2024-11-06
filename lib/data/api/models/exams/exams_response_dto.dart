import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/data/api/models/exams/exams_dto.dart';
import 'package:online_exam_app/data/api/models/metadata/metadata_dto.dart';

part 'exams_response_dto.g.dart';

@JsonSerializable()
class ExamsResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "exams")
  final List<ExamsDto>? exams;

  ExamsResponseDto ({
    this.message,
    this.metadata,
    this.exams,
  });

  factory ExamsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ExamsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamsResponseDtoToJson(this);
  }
}




