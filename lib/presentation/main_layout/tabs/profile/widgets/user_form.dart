import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/profile/profile_contract.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/profile/profile_view_model.dart';

class UserForm extends StatelessWidget {
  ProfileViewModel viewModel;

  UserForm(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    viewModel = BlocProvider.of<ProfileViewModel>(context);
    return Form(
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
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            obscuringCharacter: "*",
            readOnly: true,
            initialValue: "------------------",
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {
                  viewModel.doIntent(NavigateToChangePasswordAction());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        viewModel.locale!.change,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              label: Text(viewModel.locale!.password),
              hintText: viewModel.locale!.enterPassword,
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
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
          ValueListenableBuilder(
            valueListenable: viewModel.valid,
            builder: (context, value, child) => ElevatedButton(
                onPressed: () {
                  viewModel.doIntent(UpdateUserAction());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: value
                        ? AppColors.blue
                        : AppColors.black[AppColors.colorCode30]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(viewModel.locale!.editProfile),
                )),
          ),
        ],
      ),
    );
  }
}
