import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/constants/routes.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/utils/app_dialogs.dart';
import 'package:online_exam_app/presentation/otp_verify/Widget/otp_form.dart';
import 'package:online_exam_app/presentation/otp_verify/otp_verify_contract.dart';
import 'package:online_exam_app/presentation/otp_verify/otp_verify_view_model.dart';

class OtpVerifyView extends StatefulWidget {
  const OtpVerifyView({super.key});

  @override
  State<OtpVerifyView> createState() => _OtpVerifyViewState();
}

class _OtpVerifyViewState extends BaseState<OtpVerifyView, OtpVerifyViewModel> {
  @override
  void dispose() {
    super.dispose();
    viewModel.doIntent(DisableTimerAction());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<OtpVerifyViewModel, OtpVerifyViewState>(
        listener: (context, state) {
          if (state is OtpVerifyLoadingState ||
              state is OtpResendLoadingState) {
            AppDialogs.showLoading(
                message: viewModel.locale!.loading, context: context);
          }
          if (state is OtpSuccessState) {
            AppDialogs.showSuccessDialog(
                message: viewModel.locale!.otpIsValid,
                context: context,
                posActionTitle: viewModel.locale!.ok,
                posAction: () {
                  viewModel.doIntent(NavigateToResetPasswordScreenAction());
                });
          }
          if (state is OtpResendLoadingSuccessState) {
            AppDialogs.showSuccessDialog(
              message: viewModel.locale!.resend,
              context: context,
              posActionTitle: viewModel.locale!.ok,
            );
          }
          if (state is OtpFailState) {
            AppDialogs.showFailDialog(
              message: state.message,
              context: context,
              posActionTitle: viewModel.locale!.ok,
            );
          }
          if (state is OtpResendLoadingFailState) {
            AppDialogs.showFailDialog(
              message: state.message,
              context: context,
              posActionTitle: viewModel.locale!.ok,
            );
          }
          if (state is HideLoadingState) {
            Navigator.pop(context);
          }
          if (state is NavigateToResetPasswordScreenState) {
            Navigator.pushReplacementNamed(
                context, Routes.resetPasswordViewRoute);
          }
          if(state is OtpPreviousFocusState){
            FocusScope.of(context).previousFocus();
          }
          if (state is OtpNextFocusState){
            FocusScope.of(context).nextFocus();
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(viewModel.locale!.forgetPassword),
          ),
          body: OtpForm(),
        ),
      ),
    );
  }

  @override
  OtpVerifyViewModel initViewModel() {
    return getIt<OtpVerifyViewModel>();
  }
}
