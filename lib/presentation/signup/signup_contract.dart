sealed class SignupViewAction {}

class FormDataChangedAction extends SignupViewAction {}
class SignupAction extends SignupViewAction {}
class ChangePasswordVisibilityAction extends SignupViewAction {}
class ChangePasswordConfirmationVisibilityAction extends SignupViewAction {}
class SignupConfirmAction extends SignupViewAction {}

sealed class SignupViewState {}

class InitialSignupViewState extends SignupViewState {}

class UpdateValidationState extends SignupViewState {}
class SignupLoadingState extends SignupViewState {}
class HideLoadingState extends SignupViewState {}
class SignupSuccessState extends SignupViewState {}
class SignupFailState extends SignupViewState {
  String message;
  SignupFailState(this.message);
}
class BadRequestState extends SignupViewState {}
class ChangePasswordVisibilityState extends SignupViewState {}
class EmailAlreadyExistState extends SignupViewState {}
class UserNameAlreadyExistState extends SignupViewState {}
class NavigateToHomeScreeState extends SignupViewState {}
