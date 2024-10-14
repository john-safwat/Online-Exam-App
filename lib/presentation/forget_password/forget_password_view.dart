import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/utils/app_dialogs.dart';
import 'package:online_exam_app/presentation/forget_password/Widgets/forget_password_form.dart';
import 'package:online_exam_app/presentation/forget_password/forget_password_contract.dart';
import 'package:online_exam_app/presentation/forget_password/forget_password_view_model.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState
    extends BaseState<ForgetPasswordView, ForgetPasswordViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<ForgetPasswordViewModel, ForgetPasswordViewState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoadingState) {
            AppDialogs.showLoading(
                message: viewModel.locale!.loading, context: context);
          }
          if (state is ForgetPasswordSuccessState) {
            AppDialogs.showSuccessDialog(
                message: viewModel.locale!.otpSentToYourEmail,
                context: context,
                posActionTitle: viewModel.locale!.ok,
                posAction: () {
                  viewModel.doIntent(NavigateToOtpScreenAction());
                });
          }
          if (state is ForgetPasswordFailState) {
            AppDialogs.showFailDialog(
              message: state.message,
              context: context,
              posActionTitle: viewModel.locale!.ok,
            );
          }
          if (state is InvalidEmailState) {
            AppDialogs.showFailDialog(
              message: viewModel.locale!.invalidCredentials,
              context: context,
              posActionTitle: viewModel.locale!.tryAgain,
            );
          }
          if (state is HideLoadingState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(viewModel.locale!.forgetPassword),
          ),
          body: ForgetPasswordForm(),
        ),
      ),
    );
  }

  @override
  ForgetPasswordViewModel initViewModel() {
    return getIt<ForgetPasswordViewModel>();
  }
}
