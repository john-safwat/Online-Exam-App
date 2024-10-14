import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/presentation/signup/signup_contract.dart';
import 'package:online_exam_app/presentation/signup/signup_view_model.dart';

class SignupForm extends StatelessWidget {
  late SignupViewModel viewModel;
  SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    viewModel = BlocProvider.of<SignupViewModel>(context);
    return Form(
      onChanged: () => viewModel.doIntent(FormDataChangedAction()),
      key: viewModel.formKey,
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => viewModel.nameValidation(value ?? ""),
            keyboardType: TextInputType.name,
            controller: viewModel.nameController,
            decoration: InputDecoration(
              label: Text(viewModel.locale!.userName),
              hintText: viewModel.locale!.enterYouUserName,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => viewModel.nameValidation(value ?? ""),
                  keyboardType: TextInputType.name,
                  controller: viewModel.firstNameController,
                  decoration: InputDecoration(
                    label: Text(viewModel.locale!.firstName),
                    hintText: viewModel.locale!.enterFirstName,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => viewModel.nameValidation(value ?? ""),
                  keyboardType: TextInputType.name,
                  controller: viewModel.lastNameController,
                  decoration: InputDecoration(
                    label: Text(viewModel.locale!.lastName),
                    hintText: viewModel.locale!.enterLastName,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextFormField(
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => viewModel.emailValidation(value ?? ""),
            keyboardType: TextInputType.emailAddress,
            controller: viewModel.emailController,
            decoration: InputDecoration(
              label: Text(viewModel.locale!.email),
              hintText: viewModel.locale!.enterEmail,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      viewModel.passwordValidation(value ?? ""),
                  keyboardType: TextInputType.visiblePassword,
                  controller: viewModel.passwordController,
                  obscureText: viewModel.passwordVisible,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () =>
                          viewModel.doIntent(ChangePasswordVisibilityAction()),
                      child: Icon(viewModel.passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    label: Text(viewModel.locale!.password),
                    hintText: viewModel.locale!.enterPassword,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      viewModel.passwordConfirmationValidation(value ?? ""),
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
                    label: Text(viewModel.locale!.rePassword),
                    hintText: viewModel.locale!.rePassword,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextFormField(
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => viewModel.phoneValidation(value ?? ""),
            keyboardType: TextInputType.phone,
            controller: viewModel.phoneController,
            decoration: InputDecoration(
              label: Text(viewModel.locale!.phone),
              hintText: viewModel.locale!.enterPhone,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () => viewModel.doIntent(SignupAction()),
              style: ElevatedButton.styleFrom(
                  backgroundColor: viewModel.valid
                      ? AppColors.blue
                      : AppColors.black[AppColors.colorCode30]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(viewModel.locale!.signup),
              )),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(viewModel.locale!.alreadyHaveAccount),
              TextButton(
                  onPressed: () =>
                      viewModel.doIntent(NavigateToLoginScreenAction()),
                  child: Text(viewModel.locale!.login))
            ],
          )
        ],
      ),
    );
  }
}
