import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';

class ExamBottomSheetWidget extends StatelessWidget {
  final Exam exam;
  final String questionTitle;
  final String minutesTitle;
  final String buttonTitle;
  final Function onPress;

  const ExamBottomSheetWidget(this.exam, this.questionTitle, this.minutesTitle,
      this.buttonTitle, this.onPress,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Row(
                  children: [
                    Icon(Icons.code, color: AppColors.black),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      exam.title!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.question_mark, color: AppColors.black),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${exam.numberOfQuestions!} $questionTitle",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.timer, color: AppColors.blue),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${exam.duration!} $minutesTitle",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                onPress(exam);
              },
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(16)),
              child: SizedBox(child: Text(buttonTitle)),
            ),
          ),
        ),
      ],
    );
  }
}
