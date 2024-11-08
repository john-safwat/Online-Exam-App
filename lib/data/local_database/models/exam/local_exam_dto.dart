import 'package:isar/isar.dart';
import 'package:online_exam_app/data/local_database/models/exam/local_answer_dto.dart';
import 'package:online_exam_app/data/local_database/models/exam/local_question_dto.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/exam/question.dart';

part 'local_exam_dto.g.dart';

@collection
class LocalExamDto {
  Id? examId;
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final String? createdAt;
  final List<LocalQuestionDto?>? questions;

  LocalExamDto(
      {this.id,
      this.title,
      this.duration,
      this.subject,
      this.numberOfQuestions,
      this.active,
      this.createdAt,
      this.questions});

  factory LocalExamDto.fromDomain(Exam? exam, List<Question?> questions) =>
      LocalExamDto(
        id: exam?.id,
        title: exam?.title,
        duration: exam?.duration,
        subject: exam?.subject,
        numberOfQuestions: exam?.numberOfQuestions,
        active: exam?.active,
        createdAt: exam?.createdAt,
        questions: questions
            .map(
              (e) => LocalQuestionDto.fromDomain(e),
            )
            .toList(),
      );
}
