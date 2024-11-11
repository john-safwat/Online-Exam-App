import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/domain/entities/exam/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;

  const QuestionWidget(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question ?? "",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.start,
          ),
          ...question.answers!.map(
            (e) => Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: question.correct == e.key
                          ? AppColors.green
                          : question.selectedAnswer?.key != e.key
                          ? AppColors.blue
                          : AppColors.red
                  ),
                  color: question.correct == e.key
                      ? AppColors.lightGreen
                      : question.selectedAnswer?.key != e.key
                          ? AppColors.lightBlue
                          : AppColors.lightRed
                  ),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Radio<String>(
                    activeColor: question.correct == e.key
                        ? AppColors.green
                        : AppColors.red,
                    value: e.key ?? "",
                    groupValue: question.selectedAnswer?.key,
                    onChanged: (Object? value) {},
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      e.answer ?? "",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
