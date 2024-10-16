sealed class OtpVerifyViewState {}

class InitialOtpVerifyViewState extends OtpVerifyViewState {}

class OnCompleteCodeVerifyState extends OtpVerifyViewState {}

class OtpVerifyLoadingState extends OtpVerifyViewState {}

class HideLoadingState extends OtpVerifyViewState {}

class NavigateToResetPasswordScreenState extends OtpVerifyViewState {}

class OtpSuccessState extends OtpVerifyViewState {}

class OtpFailState extends OtpVerifyViewState {
  String message;

  OtpFailState(this.message);
}

class OtpResendState extends OtpVerifyViewState {}

class UpdateValidationState extends OtpVerifyViewState {}


sealed class OtpVerifyViewAction {}

class OnCompleteCodeVerifyAction extends OtpVerifyViewAction {}

class NavigateToResetPasswordScreenAction extends OtpVerifyViewAction {}

class OtpResendAction extends OtpVerifyViewAction {}

class FormDataChangedAction extends OtpVerifyViewAction {}

