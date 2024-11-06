sealed class ExamsListAction {}
class LoadDataAction extends ExamsListAction {}


sealed class ExamsListViewStates {}
class InitialExamsListState extends ExamsListViewStates {}
class LoadDataLoadingState extends ExamsListViewStates {}
class LoadDataLoadingSuccessState extends ExamsListViewStates {}
class LoadDataLoadingFailState extends ExamsListViewStates {
  String message;
  LoadDataLoadingFailState(this.message);
}