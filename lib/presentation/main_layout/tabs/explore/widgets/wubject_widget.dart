import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';

class SubjectWidget extends StatelessWidget {
  final Subject subject;

  const SubjectWidget(this.subject, {super.key});

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
        ]
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: subject.icon ?? "",
            height: 48,
            width: 48,
            imageBuilder: (context, imageProvider) =>
                Image(image: imageProvider),
            errorWidget: (context, url, error) =>
                const Icon(Icons.code_off, size: 48),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              subject.name ?? "",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
