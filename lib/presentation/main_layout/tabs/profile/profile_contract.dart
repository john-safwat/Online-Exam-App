sealed class ProfileAction {}

class LoadDataAction extends ProfileAction{}

sealed class ProfileViewState{}

class InitialProfileViewState extends ProfileViewState{}
class ProfileDataLoadingState extends ProfileViewState{}
class ProfileDataLoadingSuccessState extends ProfileViewState{}
class ProfileDataLoadingFailState extends ProfileViewState{
  String message;
  ProfileDataLoadingFailState(this.message);
}