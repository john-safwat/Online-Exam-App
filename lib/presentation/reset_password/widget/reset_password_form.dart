import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/presentation/reset_password/reset_password_View_model.dart';
import 'package:online_exam_app/presentation/reset_password/reset_password_contract.dart';

class ResetPasswordForm extends StatelessWidget {
  late ResetPasswordViewModel viewModel;

  ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    viewModel = BlocProvider.of<ResetPasswordViewModel>(context);
    return Form(
      onChanged: () => viewModel.doIntent(FormDataChangedAction()),
        key: viewModel.formKey,
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              viewModel.locale!.resetPassword,
              style: AppTheme.appTheme.textTheme.titleLarge!
                  .copyWith(fontSize: 18),
            ),
            const SizedBox(height: 24),
            TextFormField(
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => viewModel.passwordValidation(value ?? ""),
              keyboardType: TextInputType.visiblePassword,
              controller: viewModel.passwordController,
              obscureText: viewModel.passwordVisible,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () => viewModel.doIntent(ChangePasswordVisibilityAction()),
                  child: Icon(viewModel.passwordVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
                label: Text(viewModel.locale!.enterNewPassword),
                hintText: viewModel.locale!.enterNewPassword,
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) =>
                  viewModel.passwordConfirmationValidation(value ?? ""),
              keyboardType: TextInputType.visiblePassword,
              controller: viewModel.confirmPasswordController,
              obscureText: viewModel.passwordConfirmationVisible,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () => viewModel.doIntent(ChangePasswordConfirmVisibilityAction()),
                  child: Icon(viewModel.passwordConfirmationVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
                label: Text(viewModel.locale!.rePassword),
                hintText: viewModel.locale!.rePassword,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
                onPressed: () => viewModel.doIntent(ResetPasswordAction()),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: viewModel.valid
                        ? AppColors.blue
                        : AppColors.black[AppColors.colorCode30]),
                child: Text(viewModel.locale!.confirm)),
          ],
        ));
  }
}
