import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/data/api/models/exam/answer_dto.dart';
import 'package:online_exam_app/data/api/models/exam/question_dto.dart';
import 'package:online_exam_app/data/api/models/exams_list/exams_dto.dart';

part 'exam_response_dto.g.dart';

@JsonSerializable()
class ExamResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "questions")
  final List<QuestionsDto>? questions;

  ExamResponseDto({
    this.message,
    this.questions,
  });

  factory ExamResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ExamResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamResponseDtoToJson(this);
  }
}
