import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/assets/animation_assets.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/profile/profile_contract.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/profile/profile_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView , ProfileViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(LoadDataAction());
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print(viewModel.user?.username);
    return Center(
      child: Lottie.asset(AnimationsAssets.profileAnimation),
    );
  }

  @override
  ProfileViewModel initViewModel() {
    return getIt<ProfileViewModel>();
  }
}
