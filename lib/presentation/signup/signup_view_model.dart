import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/registration/registration_response.dart';
import 'package:online_exam_app/domain/entities/registration/registration_user.dart';
import 'package:online_exam_app/domain/use_case/signup_user_use_case.dart';
import 'package:online_exam_app/presentation/signup/signup_contract.dart';

@injectable
class SignupViewModel extends BaseViewModel<SignupViewState> {
  SignupUserUseCase signupUserUseCase;

  SignupViewModel(this.signupUserUseCase) : super(InitialSignupViewState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool valid = false;
  bool passwordVisible = true;
  bool passwordConfirmationVisible = true;

  void doIntent(SignupViewAction action) {
    switch (action) {
      case FormDataChangedAction():
        {
          _updateValidationState();
        }
      case SignupAction():
        {
          _signup();
        }
      case ChangePasswordVisibilityAction():
        {
          _changePasswordVisibility();
        }
      case ChangePasswordConfirmationVisibilityAction():
        {
          _changePasswordConfirmationVisibility();
        }
      case SignupConfirmAction():
        {
          _navigateToLoginScreen();
        }
      case NavigateToLoginScreenAction():
        {
          _navigateToLoginScreen();
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

  // validate the password is not less than 8 chars
  String? passwordValidation(String input) {
    if (input.isEmpty) {
      return locale!.passwordCantBeEmpty;
    } else if (input.length < 8) {
      return locale!.invalidPasswordLength;
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$')
        .hasMatch(input)) {
      return locale!.invalidPasswordPattern;
    }
    return null;
  }

  // validate the password confirmation is not empty and the same as the password
  String? passwordConfirmationValidation(String input) {
    if (input.isEmpty) {
      return locale!.passwordCantBeEmpty;
    } else if (input != passwordController.text) {
      return locale!.passwordDoseNotMatch;
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

  void _updateValidationState() {
    if (nameController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        phoneController.text.isEmpty) {
      valid = false;
    } else if (!formKey.currentState!.validate()) {
      valid = false;
    } else {
      valid = true;
    }
    emit(UpdateValidationState());
  }

  void _signup() async {
    if (formKey.currentState!.validate()) {
      emit(SignupLoadingState());
      var response = await signupUserUseCase(RegistrationUser(
          email: emailController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          username: nameController.text,
          password: passwordController.text,
          rePassword: confirmPasswordController.text,
          phone: phoneController.text));
      emit(HideLoadingState());
      switch (response) {
        case Success<RegistrationResponse>():
          {
            if (response.data?.code == null) {
              emit(SignupSuccessState());
            } else {
              if (response.data?.code == 409) {
                if (response.data?.message == "email already exists") {
                  emit(EmailAlreadyExistState());
                } else {
                  emit(UserNameAlreadyExistState());
                }
              } else {
                emit(BadRequestState());
              }
            }
          }
        case Failure<RegistrationResponse>():
          {
            emit(SignupFailState(mapExceptionToMessage(response.exception)));
          }
      }
    }
  }

  void _changePasswordVisibility() {
    passwordVisible = !passwordVisible;
    emit(ChangePasswordVisibilityState());
  }

  void _changePasswordConfirmationVisibility() {
    passwordConfirmationVisible = !passwordConfirmationVisible;
    emit(ChangePasswordVisibilityState());
  }

  void _navigateToLoginScreen() {
    emit(NavigateToLoginScreenState());
  }
}
