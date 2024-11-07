import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/widgets/animation_widget_builder.dart';
import 'package:online_exam_app/presentation/exam/exam_contract.dart';
import 'package:online_exam_app/presentation/exam/exam_view_model.dart';

class ExamQuestions extends StatelessWidget {
  final ExamViewModel viewModel;
  final int index;

  const ExamQuestions(this.viewModel, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
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
        LinearProgressIndicator(
          value: index / viewModel.questionCount,
          backgroundColor: AppColors.black[AppColors.colorCode10],
          borderRadius: BorderRadius.circular(100),
        ),
        const SizedBox(height: 32),

        ///-----------------[question]----------------------------
        SlideInUp(
          animate: true,
          child: Text(
            viewModel.questions[index - 1]!.question!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 32),
        AnimationWidgetBuilder(
          1,
          0,
          Column(
            children: viewModel.questions[index - 1]!.answers!
                .map(
                  (e) => InkWell(
                    onTap: () => viewModel.doIntent(SelectAnswerAction(e)),
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(8),
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
                                viewModel.doIntent(SelectAnswerAction(value!));
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

        ///-----------------[Navigation Buttons]----------------------------
        AnimationWidgetBuilder(
          2,
          0,
          Row(
            children: [
              Visibility(
                visible: index > 1,
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.doIntent(OnPressBackAction());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: AppColors.blue, width: 1),
                      ),
                    ),
                    child: Text(viewModel.locale!.back),
                  ),
                ),
              ),
              Visibility(
                visible: index > 1,
                child: SizedBox(
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
                    padding: EdgeInsets.all(16),
                    backgroundColor: AppColors.blue,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: AppColors.blue, width: 1),
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
    );
  }
}
