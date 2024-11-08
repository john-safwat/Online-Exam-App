import 'package:isar/isar.dart';
import 'package:online_exam_app/data/local_database/models/exam/local_answer_dto.dart';
import 'package:online_exam_app/domain/entities/exam/question.dart';

part 'local_question_dto.g.dart';

@embedded
class LocalQuestionDto {
  final List<LocalAnswerDto?>? answers;
  final String? type;
  final String? id;
  final String? question;
  final String? correct;
  final String? createdAt;
  LocalAnswerDto? selectedAnswer;

  LocalQuestionDto({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.createdAt,
    this.selectedAnswer,
  });

  factory LocalQuestionDto.fromDomain(Question? question) => LocalQuestionDto(
        answers: question?.answers!
            .map(
              (e) => LocalAnswerDto.fromDomain(e),
            )
            .toList(),
        type: question?.type,
        id: question?.id,
        question: question?.question,
        correct: question?.correct,
        createdAt: question?.createdAt,
        selectedAnswer: LocalAnswerDto.fromDomain(question?.selectedAnswer),
      );
}
