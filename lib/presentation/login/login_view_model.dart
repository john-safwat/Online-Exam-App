import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_request.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_response.dart';
import 'package:online_exam_app/domain/use_case/login_user_use_case.dart';
import 'package:online_exam_app/presentation/login/login_contract.dart';

@injectable
class LoginViewModel extends BaseViewModel<LoginViewState> {
  final LoginUserUseCase _loginUserUseCase;

  LoginViewModel(this._loginUserUseCase) : super(InitialLoginViewState());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ValueNotifier<bool> valid = ValueNotifier(false);
  ValueNotifier<bool> passwordVisible = ValueNotifier(true);
  ValueNotifier<bool> isRememberMeChecked = ValueNotifier(false);

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

  void doIntent(LoginViewAction action) {
    switch (action) {
      case FormDataChangedAction():
        {
          _updateValidationState();
        }
      case LoginAction():
        {
          _login();
        }
      case ChangePasswordVisibilityAction():
        {
          _changePasswordVisibility();
        }
      case NavigateToSignUpScreeAction():
        {
          _navigateToSignUpScreen();
        }
      case RememberMeButtonAction():
        {
          _changeRememberMeButton();
        }
      case NavigateToHomeScreeAction():
        {
          _navigateToHomeScreen();
        }
      case NavigateToForgetPasswordScreenAction():
        {
          _navigateToForgetPasswordScreen();
        }
    }
  }

  void _login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var response = await _loginUserUseCase(
          AuthenticationRequest(
              email: emailController.text, password: passwordController.text),
          isRememberMeChecked.value);
      emit(HideLoadingState());
      switch (response) {
        case Success<AuthenticationResponse>():
          {
            if (response.data!.token != null) {
              appConfigProvider!.token = response.data!.token ?? "";
              emit(LoginSuccessState());
            } else {
              emit(InvalidCredentialsState());
            }
          }
        case Failure<AuthenticationResponse>():
          {
            emit(LoginFailState(mapExceptionToMessage(response.exception)));
          }
      }
    }
  }

  void _updateValidationState() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      valid.value = false;
    } else if (!formKey.currentState!.validate()) {
      valid.value = false;
    } else {
      valid.value = true;
    }
  }

  void _changePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void _navigateToHomeScreen() {
    emit(NavigateToHomeScreeState());
  }

  void _navigateToSignUpScreen() {
    emit(NavigateToSignUpScreeState());
  }

  void _changeRememberMeButton() {
    isRememberMeChecked.value = !isRememberMeChecked.value;
  }

  void _navigateToForgetPasswordScreen() {
    emit(NavigateToForgetPasswordScreenState());
  }
}
