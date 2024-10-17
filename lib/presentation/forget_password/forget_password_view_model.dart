import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/forgetPassword/forget_password_response.dart';
import 'package:online_exam_app/domain/use_case/forget_password_use_case.dart';
import 'package:online_exam_app/presentation/forget_password/forget_password_contract.dart';

@injectable
class ForgetPasswordViewModel extends BaseViewModel<ForgetPasswordViewState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordViewModel(this._forgetPasswordUseCase)
      : super(InitialForgetPasswordViewState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  bool valid = false;

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

  void doIntent(ForgetPasswordViewAction action) {
    switch (action) {
      case FormDataChangedAction():
        {
          _updateValidationState();
        }
      case ForgetPasswordAction():
        {
          _forgetPassword();
        }
      case NavigateToOtpScreenAction():
        {
          _navigateToOtpScreen();
        }
    }
  }

  void _forgetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ForgetPasswordLoadingState());
      var response = await _forgetPasswordUseCase(email: emailController.text);
      emit(HideLoadingState());
      switch (response) {
        case Success<ForgetPasswordResponse>():
          {
            emit(ForgetPasswordSuccessState());
          }
        case Failure<ForgetPasswordResponse>():
          {
            emit(ForgetPasswordFailState(
                mapExceptionToMessage(response.exception)));
          }
      }
    }
  }

  void _updateValidationState() {
    if (emailController.text.isEmpty) {
      valid = false;
    } else if (!formKey.currentState!.validate()) {
      valid = false;
    } else {
      valid = true;
    }
    emit(UpdateValidationState());
  }

  void _navigateToOtpScreen() {
    appConfigProvider!.email = emailController.text;
    emit(NavigateToOtpScreenState());
  }
}
