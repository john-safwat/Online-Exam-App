import 'package:online_exam_app/domain/entities/exam/exam.dart';

sealed class ExamsListAction {}

class LoadDataAction extends ExamsListAction {}

class ShowBottomSheetAction extends ExamsListAction {
  Exam exam;

  ShowBottomSheetAction(this.exam);
}

class OnStartExamPress extends ExamsListAction {
  Exam exam;

  OnStartExamPress(this.exam);
}

///
/// -------------------[states]----------------------------------
///
sealed class ExamsListViewStates {}

class InitialExamsListState extends ExamsListViewStates {}

class LoadDataLoadingState extends ExamsListViewStates {}

class LoadDataLoadingSuccessState extends ExamsListViewStates {}

class LoadDataLoadingFailState extends ExamsListViewStates {
  String message;

  LoadDataLoadingFailState(this.message);
}

class ShowBottomSheetState extends ExamsListViewStates {
  Exam exam;

  ShowBottomSheetState(this.exam);
}

class NavigateToExamScreenState extends ExamsListViewStates {
  Exam exam;

  NavigateToExamScreenState(this.exam);
}
