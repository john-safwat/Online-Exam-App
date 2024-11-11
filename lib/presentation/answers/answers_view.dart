import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/presentation/answers/widget/question_widget.dart';

class AnswersView extends StatelessWidget {
  final Exam exam;

  const AnswersView(this.exam, {super.key});

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(locale!.answers),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) =>
            QuestionWidget(exam.questions![index]!),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: exam.questions?.length ?? 0,
      ),
    );
  }
}
