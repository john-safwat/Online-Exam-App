import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/authentication/reset_password/reset_password_request.dart';
import 'package:online_exam_app/domain/entities/authentication/reset_password/reset_password_response.dart';
import 'package:online_exam_app/domain/use_case/reset_password_use_case.dart';
import 'package:online_exam_app/presentation/reset_password/reset_password_contract.dart';

@injectable
class ResetPasswordViewModel extends BaseViewModel<ResetPasswordViewState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordViewModel(this._resetPasswordUseCase)
      : super(InitialResetPasswordViewState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool valid = false;
  bool passwordVisible = true;
  bool passwordConfirmationVisible = true;
  String? email = "";

  void doIntent(ResetPasswordViewAction action) {
    switch (action) {
      case NavigateToLoginScreenAction():
        {
          _navigateToLoginScreen();
        }
      case ResetPasswordAction():
        _resetPassword();
      case FormDataChangedAction():
        _updateValidationState();
      case ChangePasswordVisibilityAction():
        {
          _changePasswordVisibility();
        }
      case ChangePasswordConfirmVisibilityAction():
        {
          _changePasswordConfirmationVisibility();
        }
    }
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

  // validate the password confirmation is not empty and the same as the password
  String? passwordConfirmationValidation(String input) {
    if (input.isEmpty) {
      return locale!.passwordCantBeEmpty;
    } else if (input != passwordController.text) {
      return locale!.passwordDoseNotMatch;
    }
    return null;
  }

  void _updateValidationState() {
    if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      valid = false;
    } else if (!formKey.currentState!.validate()) {
      valid = false;
    } else {
      valid = true;
    }
    emit(UpdateValidationState());
  }

  void _resetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ResetPasswordViewLoadingState());
      var response = await _resetPasswordUseCase(ResetPasswordRequest(
          email: email, newPassword: passwordController.text));
      emit(HideLoadingState());
      switch (response) {
        case Success<ResetPasswordResponse>():
          emit(ResetPasswordSuccessState());
        case Failure<ResetPasswordResponse>():
          emit(ResetPasswordFailState(
              mapExceptionToMessage(response.exception)));
      }
    }
  }

  void _navigateToLoginScreen() {
    emit(NavigateToLoginScreenState());
  }

  void _changePasswordVisibility() {
    passwordVisible = !passwordVisible;
    emit(ChangePasswordVisibilityState());
  }

  void _changePasswordConfirmationVisibility() {
    passwordConfirmationVisible = !passwordConfirmationVisible;
    emit(ChangePasswordVisibilityState());
  }
}
