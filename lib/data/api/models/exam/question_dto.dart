import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/data/api/models/exam/answer_dto.dart';
import 'package:online_exam_app/data/api/models/exams_list/exams_dto.dart';
import 'package:online_exam_app/data/api/models/subject/subjects_dto.dart';
import 'package:online_exam_app/domain/entities/exam/question.dart';

part 'question_dto.g.dart';

@JsonSerializable()
class QuestionsDto {
  @JsonKey(name: "answers")
  final List<AnswersDto>? answers;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "correct")
  final String? correct;
  @JsonKey(name: "subject")
  final SubjectsDto? subject;
  @JsonKey(name: "exam")
  final ExamsDto? exam;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  QuestionsDto({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory QuestionsDto.fromJson(Map<String, dynamic> json) {
    return _$QuestionsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionsDtoToJson(this);
  }

  Question toDomain() {
    return Question(
      answers: answers
          ?.map(
            (e) => e.toDomain(),
          )
          .toList(),
      type: type,
      id: id,
      question: question,
      correct: correct,
      createdAt: createdAt,
    );
  }
}
