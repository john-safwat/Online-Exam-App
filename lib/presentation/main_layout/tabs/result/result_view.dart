import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/assets/animation_assets.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/widgets/animation_widget_builder.dart';
import 'package:online_exam_app/core/widgets/server_error_widget.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/presentation/answers/answers_view.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/result/result_contract.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/result/result_view_model.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/result/widgets/result_exam_widget.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends BaseState<ResultView, ResultViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(LoadResultsAction());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<ResultViewModel, ResultState>(
        builder: (context, state) {
          switch (state) {
            case InitialResultState():
            case ResultLoadingState():
              {
                return Center(
                  child: Lottie.asset(AnimationsAssets.resultsAnimation),
                );
              }
            case NavigateToAnswersScreenState():
            case ResultLoadingSuccessState():
              {
                return SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          viewModel.locale!.result,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Expanded(
                        child: AnimationLimiter(
                          child: ListView.separated(
                              padding: const EdgeInsets.all(16),
                              itemBuilder: (context, index) {
                                if (index < (viewModel.exams.length)) {
                                  return AnimationWidgetBuilder(
                                    index,
                                    0,
                                    ResultExamWidget(
                                      viewModel.exams[index]!,
                                      viewModel.locale!.question,
                                      viewModel.locale!.minutes,
                                      "${viewModel.locale!.correct} ${viewModel.locale!.ofTitle}",
                                      (Exam exam) {
                                        viewModel.doIntent(NavigateToAnswersScreenAction(exam));
                                      },
                                    ),
                                  );
                                } else {
                                  return AnimationWidgetBuilder(
                                    index,
                                    0,
                                    const Padding(
                                      padding: EdgeInsets.all(24),
                                      child: Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                  );
                                }
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 16,
                                  ),
                              itemCount: viewModel.exams.length),
                        ),
                      ),
                    ],
                  ),
                );
              }
            case ResultLoadingFailState():
              {
                return ServerErrorWidget(
                  state.message,
                  viewModel.locale!.tryAgain,
                  () {
                    viewModel.doIntent(
                      LoadResultsAction(),
                    );
                  },
                );
              }
          }
        },
        listener: (context, state) {
          if (state is NavigateToAnswersScreenState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AnswersView(state.exam),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  ResultViewModel initViewModel() {
    return getIt<ResultViewModel>();
  }
}
