import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/assets/animation_assets.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/constants/routes.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/presentation/main_layout/main_contract.dart';
import 'package:online_exam_app/presentation/main_layout/main_view_model.dart';

import 'tabs/explore/explore_view.dart';
import 'tabs/profile/profile_view.dart';
import 'tabs/result/result_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends BaseState<MainView, MainViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(InitializeMainViewAction());
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<MainViewModel, MainViewStates>(
        listener: (context, state) {
          if (state is NavigateToLoginState) {
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          }
        },
        builder: (context, state) {
          if (state is InvalidTokenState || state is NavigateToLoginState) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AnimationsAssets.logoutAnimation),
                    Text(viewModel.locale!.yourTokenIsInvalid , style: Theme.of(context).textTheme.titleMedium,),
                    const SizedBox(height: 16,),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.doIntent(LogoutAction());
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                      child: Text(viewModel.locale!.login),
                    ),
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: PageView(
              controller: viewModel.pageController,
              children: const [
                ExploreView(),
                ResultView(),
                ProfileView(),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              selectedIndex: viewModel.selectedIndex,
              onDestinationSelected: (value) {
                viewModel.doIntent(ChangeSelectedIndexAction(value));
              },
              destinations: [
                NavigationDestination(
                    icon: const Icon(Icons.home_outlined),
                    label: viewModel.locale!.explore),
                NavigationDestination(
                    icon: const Icon(Icons.list_alt_outlined),
                    label: viewModel.locale!.result),
                NavigationDestination(
                    icon: const Icon(Icons.person_outline),
                    label: viewModel.locale!.profile),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  MainViewModel initViewModel() {
    return getIt<MainViewModel>();
  }
}
