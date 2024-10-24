import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/presentation/reset_password/reset_password_contract.dart';
import 'package:online_exam_app/presentation/reset_password/reset_password_view_model.dart';

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
            ValueListenableBuilder(
              valueListenable: viewModel.passwordVisible,
              builder: (context, value, child) => TextFormField(
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => viewModel.passwordValidation(value ?? ""),
                keyboardType: TextInputType.visiblePassword,
                controller: viewModel.passwordController,
                obscureText: value,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () =>
                        viewModel.doIntent(ChangePasswordVisibilityAction()),
                    child:
                        Icon(value ? Icons.visibility_off : Icons.visibility),
                  ),
                  label: Text(viewModel.locale!.enterNewPassword),
                  hintText: viewModel.locale!.enterNewPassword,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ValueListenableBuilder(
              valueListenable: viewModel.passwordConfirmationVisible,
              builder: (context, value, child) => TextFormField(
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    viewModel.passwordConfirmationValidation(value ?? ""),
                keyboardType: TextInputType.visiblePassword,
                controller: viewModel.confirmPasswordController,
                obscureText: value,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () => viewModel
                        .doIntent(ChangePasswordConfirmVisibilityAction()),
                    child:
                        Icon(value ? Icons.visibility_off : Icons.visibility),
                  ),
                  label: Text(viewModel.locale!.rePassword),
                  hintText: viewModel.locale!.rePassword,
                ),
              ),
            ),
            const SizedBox(height: 32),
            ValueListenableBuilder(
              valueListenable: viewModel.valid,
              builder: (context, value, child) => ElevatedButton(
                  onPressed: () => viewModel.doIntent(ResetPasswordAction()),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: value
                          ? AppColors.blue
                          : AppColors.black[AppColors.colorCode30]),
                  child: Text(viewModel.locale!.confirm)),
            ),
          ],
        ));
  }
}
