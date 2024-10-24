sealed class LoginViewState {}

class InitialLoginViewState extends LoginViewState {}

class LoginLoadingState extends LoginViewState {}

class HideLoadingState extends LoginViewState {}

class LoginSuccessState extends LoginViewState {}

class InvalidCredentialsState extends LoginViewState {}

class NavigateToHomeScreeState extends LoginViewState {}

class NavigateToSignUpScreeState extends LoginViewState {}

class LoginFailState extends LoginViewState {
  String message;

  LoginFailState(this.message);
}

class NavigateToForgetPasswordScreenState extends LoginViewState {}

sealed class LoginViewAction {}

class ChangePasswordVisibilityAction extends LoginViewAction {}

class FormDataChangedAction extends LoginViewAction {}

class LoginAction extends LoginViewAction {}

class RememberMeButtonAction extends LoginViewAction {}

class NavigateToSignUpScreeAction extends LoginViewAction {}

class NavigateToHomeScreeAction extends LoginViewAction {}

class NavigateToForgetPasswordScreenAction extends LoginViewAction {}
