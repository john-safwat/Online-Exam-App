import 'package:dialogs/app_dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/assets/animation_assets.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/utils/app_dialogs.dart';
import 'package:online_exam_app/core/widgets/server_error_widget.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/presentation/exam/exam_contract.dart';
import 'package:online_exam_app/presentation/exam/exam_view_model.dart';
import 'package:online_exam_app/presentation/exam/widgets/exam_questions.dart';
import 'package:online_exam_app/presentation/exam/widgets/exam_results.dart';
import 'package:online_exam_app/presentation/main_layout/main_view_model.dart';

class ExamView extends StatefulWidget {
  final Exam exam;

  const ExamView(this.exam, {super.key});

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends BaseState<ExamView, ExamViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.exam = widget.exam;
    viewModel.doIntent(LoadExamQuestionsAction());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(viewModel.locale!.exam),
          actions: [
            ValueListenableBuilder(
              valueListenable: viewModel.timeMessage,
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: viewModel.isDangerTime()
                          ? AppColors.red
                          : AppColors.green,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 20,
                        color: viewModel.isDangerTime()
                            ? AppColors.red
                            : AppColors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: BlocConsumer<ExamViewModel, ExamViewState>(
          listener: (context, state) {
            if (state is ExamTimeoutState) {
              AppDialogUtils.showDialogOnScreen(
                  context: context,
                  message: viewModel.locale!.examTimedOut,
                  imagePath: AnimationsAssets.timeoutAnimation,
                  posActionTitle: viewModel.locale!.ok,
                  posAction: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
            }
            if (state is ExamCheckingState) {
              AppDialogs.showLoading(
                  message: viewModel.locale!.loading, context: context);
            }
            if (state is ExamCheckingFailState) {
              Navigator.pop(context);
              AppDialogs.showFailDialog(
                  message: state.message,
                  context: context,
                  posActionTitle: viewModel.locale!.tryAgain,
                  posAction: () {
                    viewModel.doIntent(OnPressFinishAction());
                  });
            }
            if(state is ExamCheckingSuccessState){
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            switch (state) {
              case InitialExamState():
              case ExamQuestionsLoadingState():
                {
                  return Center(
                    child: Lottie.asset(AnimationsAssets.examLoadingAnimation),
                  );
                }
              case ExamCheckingSuccessState():{
                return ExamResults(viewModel);
              }
              case RefreshState():
              case ExamTimeoutState():
              case ExamCheckingState():
              case ExamCheckingFailState():
              case ExamQuestionsLoadingSuccessState():
                {
                  return ValueListenableBuilder(
                    valueListenable: viewModel.questionIndex,
                    builder: (context, value, child) =>
                        ExamQuestions(viewModel, value),
                  );
                }
              case ExamQuestionsLoadingFailState():
                {
                  return ServerErrorWidget(
                    state.message,
                    viewModel.locale!.tryAgain,
                    () {
                      viewModel.doIntent(LoadExamQuestionsAction());
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
  ExamViewModel initViewModel() {
    return getIt<ExamViewModel>();
  }
}
