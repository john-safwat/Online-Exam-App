sealed class ExploreViewActions {}
class LoadDataAction extends ExploreViewActions {}

sealed class ExploreViewStates {}
class InitialExploreViewState extends ExploreViewStates {}
class LoadSubjectsState extends ExploreViewStates {}
class LoadSubjectsSuccessState extends ExploreViewStates {}
class LoadSubjectsFailState extends ExploreViewStates {
  String message;
  LoadSubjectsFailState(this.message);
}