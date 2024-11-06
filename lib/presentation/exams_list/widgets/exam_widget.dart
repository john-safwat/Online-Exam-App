import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';

class ExamWidget extends StatelessWidget {
  final Exam exam;
  final Subject subject;
  final String questionTitle;
  final String minutesTitle;

  const ExamWidget(
      this.exam, this.subject, this.questionTitle, this.minutesTitle,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // todo to be implemented
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
            CachedNetworkImage(
              imageUrl: subject.icon ?? "",
              height: 72,
              width: 72,
              imageBuilder: (context, imageProvider) =>
                  Image(image: imageProvider),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.code_off, size: 48),
            ),
            const SizedBox(
              width: 16,
            ),
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
                    "${exam.numberOfQuestions ?? "0"} $questionTitle",
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
