sealed class MainViewAction{}
class InitializeMainViewAction extends MainViewAction{}
class ChangeSelectedIndexAction extends MainViewAction{
  int index;
  ChangeSelectedIndexAction(this.index);
}

sealed class MainViewStates {}
class InitializeMainViewState extends MainViewStates{}
class PageChangedState extends MainViewStates{}