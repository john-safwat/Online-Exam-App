import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/utils/app_dialogs.dart';
import 'package:online_exam_app/presentation/change_password/change_password_contract.dart';
import 'package:online_exam_app/presentation/change_password/change_password_view_model.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState
    extends BaseState<ChangePasswordView, ChangePasswordViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(viewModel.locale!.changePassword),
        ),
        body: BlocConsumer<ChangePasswordViewModel, ChangePasswordViewState>(
          listener: (context, state) {
            if (state is ShowLoadingState) {
              AppDialogs.showLoading(
                  message: viewModel.locale!.loading, context: context);
            }
            if (state is HideLoadingState) {
              Navigator.pop(context);
            }
            if (state is ShowSuccessState) {
              AppDialogs.showSuccessDialog(
                  message: viewModel.locale!.passwordChangedSuccessfully,
                  context: context,
                  posActionTitle: viewModel.locale!.ok,
                  posAction: () {
                    viewModel.doIntent(NavigateToHomeScreeAction());
                  });
            }
            if (state is ShowFailState) {
              AppDialogs.showFailDialog(
                message: state.message,
                context: context,
                posActionTitle: viewModel.locale!.tryAgain,
              );
            }
          },
          builder: (context, state) => Form(
            onChanged: () {
              viewModel.doIntent(FormValidationAction());
            },
            key: viewModel.formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ValueListenableBuilder(
                  valueListenable: viewModel.passwordVisible,
                  builder: (context, value, child) => TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        viewModel.passwordValidation(value ?? ""),
                    keyboardType: TextInputType.visiblePassword,
                    controller: viewModel.passwordController,
                    obscureText: value,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () => viewModel
                            .doIntent(ChangePasswordVisibilityAction()),
                        child: Icon(
                            value ? Icons.visibility_off : Icons.visibility),
                      ),
                      label: Text(viewModel.locale!.currentPassword),
                      hintText: viewModel.locale!.currentPassword,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ValueListenableBuilder(
                  valueListenable: viewModel.newPasswordVisible,
                  builder: (context, value, child) => TextFormField(
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        viewModel.passwordValidation(value ?? ""),
                    keyboardType: TextInputType.visiblePassword,
                    controller: viewModel.newPasswordController,
                    obscureText: value,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () => viewModel
                            .doIntent(ChangeNewPasswordVisibilityAction()),
                        child: Icon(
                            value ? Icons.visibility_off : Icons.visibility),
                      ),
                      label: Text(viewModel.locale!.newPassword),
                      hintText: viewModel.locale!.newPassword,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ValueListenableBuilder(
                  valueListenable: viewModel.passwordConfirmationVisible,
                  builder: (context, value, child) => TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        viewModel.passwordConfirmationValidation(value ?? ""),
                    keyboardType: TextInputType.visiblePassword,
                    controller: viewModel.confirmPasswordController,
                    obscureText: value,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () => viewModel.doIntent(
                            ChangePasswordConfirmationVisibilityAction()),
                        child: Icon(
                            value ? Icons.visibility_off : Icons.visibility),
                      ),
                      label: Text(viewModel.locale!.rePassword),
                      hintText: viewModel.locale!.rePassword,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ValueListenableBuilder(
                  valueListenable: viewModel.valid,
                  builder: (context, value, child) => ElevatedButton(
                      onPressed: () {
                        viewModel.doIntent(ChangePasswordAction());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: value
                              ? AppColors.blue
                              : AppColors.black[AppColors.colorCode30]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(viewModel.locale!.changePassword),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  ChangePasswordViewModel initViewModel() {
    return getIt<ChangePasswordViewModel>();
  }
}
