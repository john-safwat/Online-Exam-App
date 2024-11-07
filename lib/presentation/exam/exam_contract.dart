import 'package:online_exam_app/domain/entities/exam/answer.dart';

sealed class ExamViewAction {}
class LoadExamQuestionsAction extends ExamViewAction {}
class SelectAnswerAction extends ExamViewAction {
  Answer answer;
  SelectAnswerAction(this.answer);
}
class OnPressNextAction extends ExamViewAction {}
class OnPressBackAction extends ExamViewAction {}
class OnPressFinishAction extends ExamViewAction {}
///------------------[states]-------------------------
sealed class ExamViewState {}

class InitialExamState extends ExamViewState {}

class ExamQuestionsLoadingState extends ExamViewState {}

class ExamQuestionsLoadingSuccessState extends ExamViewState {}

class ExamQuestionsLoadingFailState extends ExamViewState {
  String message;

  ExamQuestionsLoadingFailState(this.message);
}
class RefreshState extends ExamViewState {}
