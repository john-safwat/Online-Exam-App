import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/constants/routes.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/utils/app_dialogs.dart';
import 'package:online_exam_app/presentation/signup/signup_contract.dart';
import 'package:online_exam_app/presentation/signup/signup_view_model.dart';

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
                message: viewModel.local!.loading, context: context);
          }
          if (state is SignupSuccessState) {
            AppDialogs.showSuccessDialog(
              message: viewModel.local!.accountCreatedSuccessfully,
              context: context,
              posActionTitle: viewModel.local!.ok,
              posAction: () {
                viewModel.doIntent(SignupConfirmAction());
              }
            );
          }
          if (state is SignupFailState) {
            AppDialogs.showFailDialog(
              message: state.message,
              context: context,
              posActionTitle: viewModel.local!.ok,
            );
          }
          if (state is EmailAlreadyExistState) {
            AppDialogs.showFailDialog(
              message: viewModel.local!.emailAlreadyExist,
              context: context,
              posActionTitle: viewModel.local!.tryAgain,
            );
          }
          if (state is BadRequestState) {
            AppDialogs.showFailDialog(
              message: viewModel.local!.dioDefaultMessage,
              context: context,
              posActionTitle: viewModel.local!.tryAgain,
            );
          }
          if (state is UserNameAlreadyExistState) {
            AppDialogs.showFailDialog(
              message: viewModel.local!.userNameAlreadyExist,
              context: context,
              posActionTitle: viewModel.local!.tryAgain,
            );
          }
          if (state is HideLoadingState) {
            Navigator.pop(context);
          }
          if (state is NavigateToHomeScreeState) {
            Navigator.pushReplacementNamed(context, Routes.homeRoute);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(viewModel.local!.signup),
          ),
          body: Form(
            onChanged: () => viewModel.doIntent(FormDataChangedAction()),
            key: viewModel.formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => viewModel.nameValidation(value ?? ""),
                  keyboardType: TextInputType.name,
                  controller: viewModel.nameController,
                  decoration: InputDecoration(
                    label: Text(viewModel.local!.userName),
                    hintText: viewModel.local!.enterYouUserName,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            viewModel.nameValidation(value ?? ""),
                        keyboardType: TextInputType.name,
                        controller: viewModel.firstNameController,
                        decoration: InputDecoration(
                          label: Text(viewModel.local!.firstName),
                          hintText: viewModel.local!.enterFirstName,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            viewModel.nameValidation(value ?? ""),
                        keyboardType: TextInputType.name,
                        controller: viewModel.lastNameController,
                        decoration: InputDecoration(
                          label: Text(viewModel.local!.lastName),
                          hintText: viewModel.local!.enterLastName,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => viewModel.emailValidation(value ?? ""),
                  keyboardType: TextInputType.emailAddress,
                  controller: viewModel.emailController,
                  decoration: InputDecoration(
                    label: Text(viewModel.local!.email),
                    hintText: viewModel.local!.enterEmail,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            viewModel.passwordValidation(value ?? ""),
                        keyboardType: TextInputType.visiblePassword,
                        controller: viewModel.passwordController,
                        obscureText: viewModel.passwordVisible,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => viewModel
                                .doIntent(ChangePasswordVisibilityAction()),
                            child: Icon(viewModel.passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          label: Text(viewModel.local!.password),
                          hintText: viewModel.local!.enterPassword,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => viewModel
                            .passwordConfirmationValidation(value ?? ""),
                        keyboardType: TextInputType.visiblePassword,
                        controller: viewModel.confirmPasswordController,
                        obscureText: viewModel.passwordConfirmationVisible,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => viewModel.doIntent(
                                ChangePasswordConfirmationVisibilityAction()),
                            child: Icon(viewModel.passwordConfirmationVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          label: Text(viewModel.local!.rePassword),
                          hintText: viewModel.local!.rePassword,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => viewModel.phoneValidation(value ?? ""),
                  keyboardType: TextInputType.phone,
                  controller: viewModel.phoneController,
                  decoration: InputDecoration(
                    label: Text(viewModel.local!.phone),
                    hintText: viewModel.local!.enterPhone,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                    onPressed: () => viewModel.doIntent(SignupAction()),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: viewModel.valid
                            ? AppColors.blue
                            : AppColors.black[AppColors.colorCode30]),
                    child: Text(viewModel.local!.signup)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(viewModel.local!.alreadyHaveAccount),
                    TextButton(
                        onPressed: () {}, child: Text(viewModel.local!.login))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  SignupViewModel initViewModel() {
    return getIt<SignupViewModel>();
  }
}
