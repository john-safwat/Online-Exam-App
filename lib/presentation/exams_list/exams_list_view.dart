import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/assets/animation_assets.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/widgets/animation_widget_builder.dart';
import 'package:online_exam_app/core/widgets/server_error_widget.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';
import 'package:online_exam_app/presentation/exam/exam_view.dart';
import 'package:online_exam_app/presentation/exams_list/exams_list_contract.dart';
import 'package:online_exam_app/presentation/exams_list/exams_list_view_model.dart';
import 'package:online_exam_app/presentation/exams_list/widgets/exam_bottom_sheet_widget.dart';
import 'package:online_exam_app/presentation/exams_list/widgets/exam_widget.dart';

class ExamsListView extends StatefulWidget {
  final Subject subject;

  const ExamsListView(this.subject, {super.key});

  @override
  State<ExamsListView> createState() => _ExamsListViewState();
}

class _ExamsListViewState extends BaseState<ExamsListView, ExamsListViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.subject = widget.subject;
    viewModel.doIntent(LoadDataAction());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(viewModel.subject.name!),
        ),
        body: BlocConsumer<ExamsListViewModel, ExamsListViewStates>(
          listener: (context, state) {
            if (state is ShowBottomSheetState) {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.white,
                builder: (context) => ExamBottomSheetWidget(
                  state.exam,
                  viewModel.locale!.question,
                  viewModel.locale!.minutes,
                  viewModel.locale!.startExam,
                  (Exam exam) {
                    viewModel.doIntent(
                      OnStartExamPress(exam),
                    );
                  },
                ),
              );
            }
            if (state is NavigateToExamScreenState) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExamView(state.exam),
                ),
              );
            }
          },
          builder: (context, state) {
            switch (state) {
              case InitialExamsListState():
              case LoadDataLoadingState():
                {
                  return Center(
                    child: Lottie.asset(AnimationsAssets.examLoadingAnimation),
                  );
                }
              case ShowBottomSheetState():
              case NavigateToExamScreenState():
              case LoadDataLoadingSuccessState():
                {
                  if (viewModel.examsList.isEmpty) {
                    return Center(
                      child: Lottie.asset(AnimationsAssets.emptyAnimation),
                    );
                  }
                  return AnimationLimiter(
                    child: ListView.separated(
                        controller: viewModel.controller,
                        padding: EdgeInsets.all(16),
                        itemBuilder: (context, index) => AnimationWidgetBuilder(
                              index,
                              0,
                              ExamWidget(
                                viewModel.examsList[index]!,
                                viewModel.subject,
                                viewModel.locale!.question,
                                viewModel.locale!.minutes,
                                (Exam exam) {
                                  viewModel.doIntent(
                                    ShowBottomSheetAction(exam),
                                  );
                                },
                              ),
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16),
                        itemCount: viewModel.examsList.length),
                  );
                }
              case LoadDataLoadingFailState():
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
            }
          },
        ),
      ),
    );
  }

  @override
  ExamsListViewModel initViewModel() {
    return getIt<ExamsListViewModel>();
  }
}
