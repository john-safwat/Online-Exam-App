import 'package:online_exam_app/domain/entities/exam/question.dart';

class Exam {
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final String? createdAt;
  List<Question?>? questions = [];
  int correctAnswers = 0;
  int? localId = 0;

  Exam({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
    this.questions,
    this.localId,
  });
  @override
  String toString() {
    return 'Exam('
        'id: $id, '
        'title: $title, '
        'duration: $duration, '
        'subject: $subject, '
        'numberOfQuestions: $numberOfQuestions, '
        'active: $active, '
        'createdAt: $createdAt, '
        'questions: ${questions?.map((q) => q.toString()).toList()}, '
        'correctAnswers: $correctAnswers'
        ')';
  }
}