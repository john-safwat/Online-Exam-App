sealed class MainViewAction {}

class InitializeMainViewAction extends MainViewAction {}

class ChangeSelectedIndexAction extends MainViewAction {
  int index;

  ChangeSelectedIndexAction(this.index);
}

class LogoutAction extends MainViewAction {}

sealed class MainViewStates {}

class InitializeMainViewState extends MainViewStates {}

class PageChangedState extends MainViewStates {}

class InvalidTokenState extends MainViewStates {}
class NavigateToLoginState extends MainViewStates {}
