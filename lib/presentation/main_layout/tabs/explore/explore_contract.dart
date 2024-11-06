import 'package:online_exam_app/domain/entities/subject/subjects.dart';

sealed class ExploreViewActions {}
class LoadDataAction extends ExploreViewActions {}
class SearchAction extends ExploreViewActions {
  String searchText;
  SearchAction(this.searchText);
}

class OnSubjectPressAction extends ExploreViewActions {
  Subject subject;

  OnSubjectPressAction(this.subject);
}

sealed class ExploreViewStates {}
class InitialExploreViewState extends ExploreViewStates {}
class LoadSubjectsState extends ExploreViewStates {}
class LoadSubjectsSuccessState extends ExploreViewStates {}
class LoadSubjectsFailState extends ExploreViewStates {
  String message;
  LoadSubjectsFailState(this.message);
}
class NavigateToExamsListState extends ExploreViewStates {
  Subject subject;
  NavigateToExamsListState(this.subject);
}