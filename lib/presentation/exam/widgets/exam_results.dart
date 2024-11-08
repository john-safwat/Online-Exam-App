import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/presentation/exam/exam_contract.dart';
import 'package:online_exam_app/presentation/exam/exam_view_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

//ignore: must_be_immutable
class ExamResults extends StatelessWidget {
  ExamViewModel viewModel;

  ExamResults(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          viewModel.locale!.yourAnswers,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            CircularPercentIndicator(
              radius: MediaQuery.of(context).size.width * 0.2,
              lineWidth: 10.0,
              backgroundColor: AppColors.red,
              percent: (viewModel.gradePercent / 100),
              center: Text("${viewModel.gradePercent.toStringAsFixed(1)}%",
                  style: Theme.of(context).textTheme.titleLarge),
              progressColor: AppColors.blue,
            ),
            const SizedBox(width: 16),
            Expanded(
                child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      viewModel.locale!.correct,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.blue),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.blue),
                          shape: BoxShape.circle),
                      child: Text(
                        viewModel.correctCount.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.blue),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      viewModel.locale!.incorrect,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.red),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.red),
                          shape: BoxShape.circle),
                      child: Text(
                        viewModel.incorrectCount.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.red),
                      ),
                    )
                  ],
                ),
              ],
            ))
          ],
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              backgroundColor: AppColors.blue),
          child: Text(viewModel.locale!.showResults),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            viewModel.doIntent(StartAgainAction());
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            foregroundColor: AppColors.blue,
            backgroundColor: AppColors.white,
            side: const BorderSide(width: 1, color: AppColors.blue),
          ),
          child: Text(viewModel.locale!.startAgain),
        )
      ],
    );
  }
}
