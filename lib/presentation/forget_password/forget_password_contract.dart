sealed class ForgetPasswordViewState {}

class InitialForgetPasswordViewState extends ForgetPasswordViewState {}

class ForgetPasswordLoadingState extends ForgetPasswordViewState {}

class HideLoadingState extends ForgetPasswordViewState {}

class ForgetPasswordSuccessState extends ForgetPasswordViewState {}

class ForgetPasswordFailState extends ForgetPasswordViewState {
  String message;

  ForgetPasswordFailState(this.message);
}

class InvalidEmailState extends ForgetPasswordViewState {}

class NavigateToOtpScreenState extends ForgetPasswordViewState {}

sealed class ForgetPasswordViewAction {}

class FormDataChangedAction extends ForgetPasswordViewAction {}

class ForgetPasswordAction extends ForgetPasswordViewAction {}

class NavigateToOtpScreenAction extends ForgetPasswordViewAction {}
