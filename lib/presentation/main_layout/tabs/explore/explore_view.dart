import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/assets/animation_assets.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/widgets/server_error_widget.dart';
import 'package:online_exam_app/presentation/main_layout/main_view_model.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/explore/explore_contract.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/explore/explore_view_model.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/explore/widgets/wubject_widget.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends BaseState<ExploreView, ExploreViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.mainViewModel =
        BlocProvider.of<MainViewModel>(context, listen: false);
    viewModel.doIntent(LoadDataAction());
  }

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
                  borderRadius: BorderRadius.circular(24),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                hintText: viewModel.locale!.search,
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<ExploreViewModel, ExploreViewStates>(
              builder: (context, state) {
                switch (state) {
                  case LoadSubjectsSuccessState():
                    {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              viewModel.locale!.browseByCategory,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              controller: viewModel.scrollController,
                              padding: const EdgeInsets.all(16),
                              itemBuilder: (context, index) {
                                if (index < (viewModel.subjects.length)) {
                                  return SubjectWidget(
                                      viewModel.subjects[index]!);
                                } else {
                                  return const Padding(
                                    padding: EdgeInsets.all(24),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  );
                                }
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 16,
                              ),
                              itemCount: viewModel.subjects.length +
                                  (viewModel.pageNumber <=
                                          (viewModel.maxPage ?? 1)
                                      ? 1
                                      : 0),
                            ),
                          ),
                        ],
                      );
                    }
                  case LoadSubjectsFailState():
                    {
                      return ServerErrorWidget(
                        state.message,
                        viewModel.locale!.tryAgain,
                        () {
                          viewModel.doIntent(
                            LoadDataAction(),
                          );
                        },
                      );
                    }
                  case InitialExploreViewState():
                  case LoadSubjectsState():
                    {
                      return Center(
                        child:
                            Lottie.asset(AnimationsAssets.examLoadingAnimation),
                      );
                    }
                }
              },
              listener: (context, state) {},
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
