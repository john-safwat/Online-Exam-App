import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/presentation/exam/exam_contract.dart';
import 'package:online_exam_app/presentation/exam/exam_view_model.dart';

class ExamQuestions extends StatelessWidget {
  final ExamViewModel viewModel;
  final int index;

  const ExamQuestions(this.viewModel, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ///-----------------[top_bar]----------------------------
            Text(
              "${viewModel.locale!.question} "
              "$index "
              "${viewModel.locale!.ofTitle} ${viewModel.questionCount}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            FAProgressBar(
              maxValue: viewModel.questionCount.toDouble(),
              currentValue: index.toDouble(),
              progressColor: AppColors.blue,
              size: 10,
              backgroundColor: AppColors.black[AppColors.colorCode10]!,
              borderRadius: BorderRadius.circular(100),
            ),
            const SizedBox(height: 32),

            ///-----------------[question]----------------------------
            SlideInLeft(
              animate: true,
              manualTrigger: true,
              from: 200,
              controller: (p0) {
                viewModel.questionAnimationController = p0;
              },
              child: Text(
                viewModel.questions[index - 1]!.question!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 32),
            SlideInLeft(
              animate: true,
              manualTrigger: true,
              from: 400,
              controller: (p0) {
                viewModel.answersAnimationController = p0;
              },
              child: Column(
                children: viewModel.questions[index - 1]!.answers!
                    .map(
                      (e) => InkWell(
                        onTap: () => viewModel.doIntent(SelectAnswerAction(e)),
                        overlayColor:
                            WidgetStateProperty.all(Colors.transparent),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: e.selected
                                  ? AppColors.blue[AppColors.colorCode10]
                                  : AppColors.lightBlue,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Radio(
                                  value: e,
                                  activeColor: AppColors.blue,
                                  groupValue: viewModel
                                      .questions[index - 1]?.selectedAnswer,
                                  onChanged: (value) {
                                    viewModel
                                        .doIntent(SelectAnswerAction(value!));
                                  }),
                              Expanded(child: Text(e.answer ?? "No Answer"))
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),

        ///-----------------[Navigation Buttons]----------------------------
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SlideInUp(
                animate: true,
                child: Row(
                  children: [
                    Visibility(
                      visible: index > 1,
                      child: Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.doIntent(OnPressBackAction());
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            backgroundColor: AppColors.white,
                            foregroundColor: AppColors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: const BorderSide(color: AppColors.blue, width: 1),
                            ),
                          ),
                          child: Text(viewModel.locale!.back),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: index > 1,
                      child: const SizedBox(
                        width: 16,
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (index == viewModel.questionCount) {
                            viewModel.doIntent(OnPressFinishAction());
                          } else {
                            viewModel.doIntent(OnPressNextAction());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          backgroundColor: AppColors.blue,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(color: AppColors.blue, width: 1),
                          ),
                        ),
                        child: Text(
                          index == viewModel.questionCount
                              ? viewModel.locale!.finish
                              : viewModel.locale!.next,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
