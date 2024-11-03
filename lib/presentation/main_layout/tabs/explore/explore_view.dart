import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/explore/explore_view_model.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends BaseState<ExploreView, ExploreViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                viewModel.locale!.survey,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.blue),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: viewModel.locale!.search,
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ExploreViewModel initViewModel() {
    return getIt<ExploreViewModel>();
  }
}
