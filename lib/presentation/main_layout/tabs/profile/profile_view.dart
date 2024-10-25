import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/assets/animation_assets.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/constants/routes.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/utils/app_dialogs.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/profile/profile_contract.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/profile/profile_view_model.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/profile/widgets/user_form.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView, ProfileViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(LoadDataAction());
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.doIntent(ClearAction());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: BlocProvider(
        create: (context) => viewModel,
        child: Scaffold(
          appBar: AppBar(
            title: Text(viewModel.locale!.editProfile),
          ),
          body: BlocConsumer<ProfileViewModel, ProfileViewState>(
            listener: (context, state) {
              if (state is NavigateToChangePasswordState) {
                Navigator.pushNamed(context, Routes.changePasswordViewRoute);
              }
              if (state is ShowLoadingState) {
                AppDialogs.showLoading(
                    message: viewModel.locale!.loading, context: context);
              }
              if (state is HideLoadingState) {
                Navigator.pop(context);
              }
              if (state is ShowSuccessMessageState) {
                AppDialogs.showSuccessDialog(
                    message: viewModel.locale!.profileUpdateSuccessfully,
                    context: context,
                    posActionTitle: viewModel.locale!.ok);
              }
              if (state is ShowFailMessageState) {
                AppDialogs.showFailDialog(
                    message: state.message,
                    context: context,
                    posActionTitle: viewModel.locale!.tryAgain);
              }
            },
            builder: (context, state) {
              if (state is ProfileDataLoadingState) {
                return Center(
                  child: Lottie.asset(AnimationsAssets.profileAnimation),
                );
              } else if (state is ProfileDataLoadingFailState) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(AnimationsAssets.notFoundAnimation),
                      Text(
                        state.message,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          viewModel.doIntent(LoadDataAction());
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                        ),
                        child: Text(viewModel.locale!.tryAgain),
                      ),
                    ],
                  ),
                );
              } else {
                return UserForm(viewModel);
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  ProfileViewModel initViewModel() {
    return getIt<ProfileViewModel>();
  }
}
