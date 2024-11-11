
import 'package:online_exam_app/domain/entities/exam/exam.dart';

sealed class ResultAction {}
class LoadResultsAction extends ResultAction {}
class NavigateToAnswersScreenAction extends ResultAction {
  Exam exam;
  NavigateToAnswersScreenAction(this.exam);
}


///---------------------[ State ]-------------------------------
sealed class ResultState {}
class InitialResultState extends ResultState {}
class ResultLoadingState extends ResultState {}
class ResultLoadingSuccessState extends ResultState {}
class ResultLoadingFailState extends ResultState {
  String message;

  ResultLoadingFailState(this.message);
}
class NavigateToAnswersScreenState extends ResultState {
  Exam exam;
  NavigateToAnswersScreenState(this.exam);
}
