import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';

part 'subjects_dto.g.dart';
@collection
@JsonSerializable()
class SubjectsDto {
  Id? id = Isar.autoIncrement;
  @JsonKey(name: "_id")
  final String? subjectId;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  SubjectsDto ({
    this.subjectId,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory SubjectsDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectsDtoToJson(this);
  }

  Subject toDomain(){
    return Subject(
        id: subjectId,
        name: name,
        icon: icon,
        createdAt: createdAt,
    );
  }
}