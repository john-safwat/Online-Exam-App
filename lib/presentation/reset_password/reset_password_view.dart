import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/constants/routes.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/utils/app_dialogs.dart';
import 'package:online_exam_app/presentation/reset_password/reset_password_view_model.dart';
import 'package:online_exam_app/presentation/reset_password/reset_password_contract.dart';
import 'package:online_exam_app/presentation/reset_password/widget/reset_password_form.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState
    extends BaseState<ResetPasswordView, ResetPasswordViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<ResetPasswordViewModel, ResetPasswordViewState>(
        listener: (context, state) {
          if (state is ResetPasswordViewLoadingState) {
            AppDialogs.showLoading(
                message: viewModel.locale!.loading, context: context);
          }
          if (state is HideLoadingState) {
            Navigator.pop(context);
          }
          if (state is NavigateToLoginScreenState) {
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          }
          if (state is ResetPasswordFailState) {
            AppDialogs.showFailDialog(
              message: state.message,
              context: context,
              posActionTitle: viewModel.locale!.ok,
            );
          }
          if (state is ResetPasswordSuccessState) {
            AppDialogs.showSuccessDialog(
              message: viewModel.locale!.passwordChangedSuccessfully,
              context: context,
              posActionTitle: viewModel.locale!.ok,
              posAction: () {
                viewModel.doIntent(NavigateToLoginScreenAction());
              },
            );
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(viewModel.locale!.forgetPassword),
          ),
          body: ResetPasswordForm(),
        ),
      ),
    );
  }

  @override
  ResetPasswordViewModel initViewModel() {
    return getIt<ResetPasswordViewModel>();
  }
}
