sealed class ResetPasswordViewState {}

class InitialResetPasswordViewState extends ResetPasswordViewState {}

class ResetPasswordViewLoadingState extends ResetPasswordViewState {}

class HideLoadingState extends ResetPasswordViewState {}

class NavigateToLoginScreenState extends ResetPasswordViewState {}

class UpdateValidationState extends ResetPasswordViewState {}

class ResetPasswordSuccessState extends ResetPasswordViewState {}

class ResetPasswordFailState extends ResetPasswordViewState {
  String message;

  ResetPasswordFailState(this.message);
}

class ChangePasswordVisibilityState extends ResetPasswordViewState {}

sealed class ResetPasswordViewAction {}

class NavigateToLoginScreenAction extends ResetPasswordViewAction {}

class ResetPasswordAction extends ResetPasswordViewAction {}

class FormDataChangedAction extends ResetPasswordViewAction {}

class ChangePasswordVisibilityAction extends ResetPasswordViewAction {}

class ChangePasswordConfirmVisibilityAction extends ResetPasswordViewAction {}