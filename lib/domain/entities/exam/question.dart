import 'package:online_exam_app/domain/entities/exam/answer.dart';

class Question {
  final List<Answer>? answers;
  final String? type;
  final String? id;
  final String? question;
  final String? correct;
  final String? createdAt;
  Answer? selectedAnswer;

  Question({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.createdAt,
  });
}
