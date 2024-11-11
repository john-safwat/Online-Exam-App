sealed class ProfileAction {}

class LoadDataAction extends ProfileAction {}

class FormDataChangedAction extends ProfileAction {}

class NavigateToChangePasswordAction extends ProfileAction {}

class UpdateUserAction extends ProfileAction {}

class ClearAction extends ProfileAction {}

sealed class ProfileViewState {}

class InitialProfileViewState extends ProfileViewState {}

class ProfileDataLoadingState extends ProfileViewState {}

class ProfileDataLoadingSuccessState extends ProfileViewState {}

class ProfileDataLoadingFailState extends ProfileViewState {
  String message;

  ProfileDataLoadingFailState(this.message);
}

class NavigateToChangePasswordState extends ProfileViewState {}

class ShowLoadingState extends ProfileViewState {}

class HideLoadingState extends ProfileViewState {}

class ShowSuccessMessageState extends ProfileViewState {}

class ShowFailMessageState extends ProfileViewState {
  String message;

  ShowFailMessageState(this.message);
}
