import 'package:isar/isar.dart';
import 'package:online_exam_app/domain/entities/exam/answer.dart';

part 'local_answer_dto.g.dart';

@embedded
class LocalAnswerDto {
  final String? answer;
  final String? key;

  LocalAnswerDto({
    this.answer,
    this.key,
  });

  factory LocalAnswerDto.fromDomain(Answer? answer) =>
      LocalAnswerDto(key: answer?.key, answer: answer?.answer);

  Answer toDomain() {
    return Answer(answer: answer, key: key);
  }
}
