import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/providers/app_config_provider.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/edit_user_info_request/edit_user_info_request.dart';
import 'package:online_exam_app/domain/entities/user/user.dart';
import 'package:online_exam_app/domain/use_case/get_user_info_use_case.dart';
import 'package:online_exam_app/domain/use_case/update_user_info_use_case.dart';
import 'package:online_exam_app/presentation/main_layout/main_view_model.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/profile/profile_contract.dart';

@injectable
class ProfileViewModel extends BaseViewModel<ProfileViewState> {
  GetUserInfoUseCase getUserInfoUseCase;
  UpdateUserInfoUseCase updateUserInfoUseCase;
  late MainViewModel mainViewModel;
  ProfileViewModel(this.getUserInfoUseCase, this.updateUserInfoUseCase)
      : super(InitialProfileViewState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  ValueNotifier<bool> valid = ValueNotifier(false);
  User? user;

  void doIntent(ProfileAction action) {
    switch (action) {
      case LoadDataAction():
        {
          _loadData();
        }
      case FormDataChangedAction():
        {
          _updateValidationState();
        }
      case NavigateToChangePasswordAction():
        {
          _navigateToChangePassword();
        }
      case UpdateUserAction():
        {
          _updateUserData();
        }
      case ClearAction():
        {
          _clear();
        }
    }
  }

  _clear() {
    nameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    valid.dispose();
  }

  void _loadData() async {
    emit(ProfileDataLoadingState());
    var response = await getUserInfoUseCase(getIt<AppConfigProvider>().token);
    switch (response) {
      case Success<User?>():
        {
          _initUser(response.data);
          emit(ProfileDataLoadingSuccessState());
        }
      case Failure<User?>():
        {
          emit(ProfileDataLoadingFailState(
              mapExceptionToMessage(response.exception)));
          mainViewModel.validateOnException(response.exception);
        }
    }
  }

  // validation functions
  // validate on the name if it is not empty and doesn't contain ant spacial characters
  String? nameValidation(String name) {
    if (name.isEmpty) {
      return locale!.nameCantBeEmpty;
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)) {
      return locale!.invalidName;
    } else {
      return null;
    }
  }

  // validate on the email form
  String? emailValidation(String input) {
    if (input.isEmpty) {
      return locale!.emailCantBeEmpty;
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
            r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input)) {
      return locale!.enterAValidEmail;
    }
    return null;
  }

  // mobile validation function to check for the phone number
  String? phoneValidation(String value) {
    if (value.isEmpty) {
      return locale!.enterPhoneNumber;
    } else if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(value)) {
      return locale!.enterValidMobileNumber;
    }
    return null;
  }

  void _initUser(User? data) {
    user = data;
    emailController.text = data?.email ?? "";
    phoneController.text = data?.phone ?? "";
    firstNameController.text = data?.firstName ?? "";
    lastNameController.text = data?.lastName ?? "";
    nameController.text = data?.username ?? "";
  }

  void _updateValidationState() {
    if (nameController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      valid.value = false;
    } else if (!formKey.currentState!.validate()) {
      valid.value = false;
    } else {
      valid.value = true;
    }
  }

  void _navigateToChangePassword() {
    appConfigProvider!.email = user?.email ?? "none";
    emit(NavigateToChangePasswordState());
  }

  void _updateUserData() async {
    if (!valid.value) {
      return;
    }

    if (formKey.currentState!.validate()) {
      emit(ShowLoadingState());
      var response = await updateUserInfoUseCase(
          appConfigProvider!.token,
          EditUserInfoRequest(
              username: nameController.text,
              email: emailController.text,
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              phone: phoneController.text));
      emit(HideLoadingState());

      switch (response) {
        case Success<User?>():
          {
            emit(ShowSuccessMessageState());
          }
        case Failure<User?>():
          {
            emit(ShowFailMessageState(
                mapExceptionToMessage(response.exception)));
          }
      }
    }
  }
}
