import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/constants/routes.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/utils/app_dialogs.dart';
import 'package:online_exam_app/presentation/signup/signup_contract.dart';
import 'package:online_exam_app/presentation/signup/signup_view_model.dart';
import 'package:online_exam_app/presentation/signup/widgets/signup_form.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends BaseState<SignupView, SignupViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<SignupViewModel, SignupViewState>(
        listener: (context, state) {
          if (state is SignupLoadingState) {
            AppDialogs.showLoading(
                message: viewModel.locale!.loading, context: context);
          }
          if (state is SignupSuccessState) {
            AppDialogs.showSuccessDialog(
                message: viewModel.locale!.accountCreatedSuccessfully,
                context: context,
                posActionTitle: viewModel.locale!.ok,
                posAction: () {
                  viewModel.doIntent(SignupConfirmAction());
                });
          }
          if (state is SignupFailState) {
            AppDialogs.showFailDialog(
              message: state.message,
              context: context,
              posActionTitle: viewModel.locale!.ok,
            );
          }
          if (state is EmailAlreadyExistState) {
            AppDialogs.showFailDialog(
              message: viewModel.locale!.emailAlreadyExist,
              context: context,
              posActionTitle: viewModel.locale!.tryAgain,
            );
          }
          if (state is BadRequestState) {
            AppDialogs.showFailDialog(
              message: viewModel.locale!.dioDefaultMessage,
              context: context,
              posActionTitle: viewModel.locale!.tryAgain,
            );
          }
          if (state is UserNameAlreadyExistState) {
            AppDialogs.showFailDialog(
              message: viewModel.locale!.userNameAlreadyExist,
              context: context,
              posActionTitle: viewModel.locale!.tryAgain,
            );
          }
          if (state is HideLoadingState) {
            Navigator.pop(context);
          }
          if (state is NavigateToHomeScreeState) {
            Navigator.pushReplacementNamed(context, Routes.homeRoute);
          }
          if (state is NavigateToLoginScreenState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(viewModel.locale!.signup),
          ),
          body: const SignupForm(),
        ),
      ),
    );
  }

  @override
  SignupViewModel initViewModel() {
    return getIt<SignupViewModel>();
  }
}
