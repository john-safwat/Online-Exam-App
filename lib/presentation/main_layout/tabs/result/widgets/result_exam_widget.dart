import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/assets/animation_assets.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';

class ResultExamWidget extends StatelessWidget {
  final Exam exam;
  final String questionTitle;
  final String minutesTitle;
  final String correctTitle;
  final Function onPress;

  const ResultExamWidget(this.exam, this.questionTitle, this.minutesTitle,
      this.correctTitle, this.onPress,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress(exam);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.black[AppColors.colorCode10]!,
                blurRadius: 8,
                offset: const Offset(0, 0),
              )
            ]),
        child: Row(
          children: [
            Lottie.asset(
                (exam.correctAnswers) >= ((exam.questions?.length ?? 0) / 2)
                    ? AnimationsAssets.checkAnimation
                    : AnimationsAssets.errorAnimation,
                height: 64,
                width: 64),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exam.title ?? "",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${exam.correctAnswers} $correctTitle ${exam.questions?.length ?? 0}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${exam.duration} $minutesTitle",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.blue,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
