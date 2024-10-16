import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/authentication/verify_reset_code/verify_reset_code_request.dart';
import 'package:online_exam_app/domain/entities/authentication/verify_reset_code/verify_reset_code_response.dart';
import 'package:online_exam_app/domain/use_case/verify_reset_code_use_case.dart';
import 'package:online_exam_app/presentation/otp_verify/otp_verify_contract.dart';

@injectable
class OtpVerifyViewModel extends BaseViewModel<OtpVerifyViewState> {
  final VerifyResetPasswordUseCase _verifyResetPasswordUseCase;

  OtpVerifyViewModel(
      this._verifyResetPasswordUseCase )
      : super(InitialOtpVerifyViewState());
  final TextEditingController otpController = TextEditingController();
  void doIntent(OtpVerifyViewAction action) {
    switch (action) {
      case OnCompleteCodeVerifyAction():
        {
          _otpVerify();
        }

      case NavigateToResetPasswordScreenAction():
        {
          _navigateToResetPasswordScreen();
        }
      case OtpResendAction():
        {
          _resendOtp();
        }
    }
  }

  void _navigateToResetPasswordScreen() {
    emit(NavigateToResetPasswordScreenState());
  }

  void _otpVerify() async {
    emit(OtpVerifyLoadingState());
    var response = await _verifyResetPasswordUseCase
        .call(VerifyResetCodeRequest(resetCode: otpController.text));
    emit(HideLoadingState());
    switch (response) {
      case Success<VerifyResetCodeResponse>():
        {
          emit(OtpSuccessState());
        }
      case Failure<VerifyResetCodeResponse>():
        {
          emit(OtpFailState(mapExceptionToMessage(response.exception)));
        }
    }
  }

  void _resendOtp() async {
    // emit(OtpVerifyLoadingState());
    // var response =
    //     await _forgetPasswordUseCase.call(ForgetPasswordRequest(email: ""));
    // emit(HideLoadingState());
    //
    // switch (response) {
    //   case Success<ForgetPasswordResponse>():
    //     {}
    //   case Failure<ForgetPasswordResponse>():
    //     {}
    // }
  }
}
